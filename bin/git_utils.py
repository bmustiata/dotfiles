import re
import subprocess
from typing import Set, List, Dict

BACKPORT_BRANCH_CHECK = re.compile(r'^.*?/\d+\.\d+(.+)?/.*$')
BRANCH_NAME_PARSER = re.compile(r'(remotes/origin/)?(.+?)(/(\d+\.\d+(.+)?))?/(.*)$')
BRANCH_ISSUE_ID_PARSER = re.compile(r'^.+/(\w+-?\d+)-?(.+?)$')
GIT_URL_PARSER = re.compile(r'git@(.*?):([^/]+)/((.*?)(.git)?)$')


def normalize_issue_name(issue_id):
    if re.compile(r'\d+').match(issue_id):
        return "WEBUI-%s" % issue_id

    return issue_id.upper()


def get_branch_name_for_different_version(existing_branch_name, version):
    m = BRANCH_NAME_PARSER.match(existing_branch_name)

    if not m:
        raise Exception("Unable to parse branch name: %s" % existing_branch_name)

    if version == "master" or version == "develop":
        return "%s/%s" % (m.group(2), m.group(6))

    return "%s/%s/%s" % (m.group(2), version, m.group(6))


class Commit(object):
    def __init__(self, hashcode, message):
        self.hash = hashcode
        self.message = message

    def __repr__(self):
        return "Commit(%s): %s" % (self.hash, self.message)


def is_backport_branch(branch_name):
    result = BACKPORT_BRANCH_CHECK.match(branch_name)
    return result


def get_checked_out_branch_name() -> str:
    return subprocess.check_output(["git", "rev-parse", "--abbrev-ref", "HEAD"]) \
                     .strip() \
                     .decode('utf-8')


def get_checkout_issue_number() -> str:
    current_branch = get_checked_out_branch_name()  # type: str

    m = BRANCH_ISSUE_ID_PARSER.match(current_branch)

    if not m:
        raise Exception("Unable to find the issue number from: %s" % current_branch)

    return m.group(1)


def get_checkout_branch_suffix_name() -> str:
    """
    Get the string of the branch after the issue number.
    """
    current_branch = get_checked_out_branch_name()  # type: str

    m = BRANCH_ISSUE_ID_PARSER.match(current_branch)

    if not m:
        raise Exception("Unable to find the suffix from: %s" % current_branch)

    return m.group(2)



def get_checkout_version() -> str:
    current_branch = get_checked_out_branch_name()  # type: str

    m = BRANCH_NAME_PARSER.match(current_branch)

    if not m:
        raise Exception("Unable to find the version from: %s" % current_branch)

    version = m.group(4)

    if not version:
        return "master"

    return version


def local_branch_name(branch_name):
    return branch_name if not branch_name.startswith("remotes/origin/") else branch_name[15:]


_all_branches_cache = None


def all_branches(use_cache=True) -> Set[str]:
    """
    Get all the git branches available in this git repository.
    It will also cache them, so operations such as adding branches,
    should call this function with use_cahe=False
    """
    global _all_branches_cache

    if _all_branches_cache and use_cache:
        return _all_branches_cache

    _all_branches_cache = set(map(local_branch_name,
                                  filter(lambda line: ' ' not in line,
                                         map(lambda line: line.strip(),
                                             subprocess.check_output(["git", "branch", "-a"])
                                                       .decode('utf-8')
                                                       .split("\n")))))

    return _all_branches_cache


branch_by_issue_id_cache: Dict[str, str] = dict()


def find_branches_for_issue_id(issue_id: str) -> List[str]:
    issue_substring = '/%s-' % issue_id

    branches = list(filter(lambda branch: issue_substring in branch, all_branches()))

    return branches


def find_branch_by_issue_id(version: str, issue_id: str) -> str:
    branches = None

    issue_id = normalize_issue_name(issue_id)

    version_substring = '/%s/' % version
    issue_substring = '/%s-' % issue_id

    if version == "master" or version == "develop":
        branches = list(filter(lambda branch: not is_backport_branch(branch) and issue_substring in branch,
                               all_branches()))
    else:
        branches = list(filter(lambda line: version_substring in line and issue_substring in line,
                               all_branches()))

    if len(branches) > 1:  # type: ignore
        if issue_id in branch_by_issue_id_cache:
            return branch_by_issue_id_cache[issue_id]

        print("Multiple branches were found for version %s, and issue %s: \n  %s\n"
              "Please select the index of the branch to use." %
              (version, issue_id, "\n  ".join(branches)))

        index = int(input())  # NOQA

        branch_by_issue_id_cache[issue_id] = branches[index]
        return branches[index]

    if len(branches) == 0:
        raise Exception("No branch was found for version %s, and issue %s." %
                        (version, issue_id))

    return branches[0]


def get_base_branch(version):
    if version == "master" or version == "develop":
        other_branch = {
            "master": "develop",
            "develop": "master"
        }

        if version not in all_branches():
            return other_branch[version]

        return version

    if ('maint/' + version) in all_branches():
        return 'origin/maint/' + version

    if ('release/' + version) in all_branches():
        return 'release/' + version

    raise Exception("Unable to find a maint/%s nor a release/%s branch." % (version, version))


def get_all_commits(branch_name):
    git_command = ["git", "log", '--pretty=format:%H %s', "remotes/origin/" + branch_name]

    for line in subprocess.check_output(git_command).decode('utf-8').split("\n"):
        line_tokens = line.strip().split(' ', 1)

        if len(line_tokens) <= 1:
            print(f"WARNING: failure reading commit info from line: {line} <skipped>")
            continue

        yield Commit(line_tokens[0], line_tokens[1])



def get_commits_for_branch(branch_name, issue_id=None) -> List[Commit]:
    if branch_name not in all_branches():
        raise Exception("Unable to find branch: %s" % branch_name)

    if not issue_id:
        return list(all_commits)

    issue_id = normalize_issue_name(issue_id)

    search_re = f'{issue_id}\W'
    print(f"searching: {search_re} commits in {branch_name}")
    issue_marker = re.compile(issue_id, re.IGNORECASE)  # FIXME: not so great
    merge_test = re.compile('^Merge')

    return list(filter(lambda commit: issue_marker.match(commit.message) and
                       not merge_test.match(commit.message),
                       get_all_commits(branch_name)))


def get_commit_message(*, ref: str="HEAD") -> str:
    """
    Gets the last commit message.
    """
    return subprocess.check_output(["git", "log", "--format=%B", "-n", "1", ref])\
            .decode("utf-8")\
            .strip()


def find_github_url() -> str:
    remote_url = get_remote_origin_url()
    m = GIT_URL_PARSER.match(remote_url)

    if not m:
        raise Exception(f"Unable to read git url from {remote_url}")

    return f"https://{m.group(1)}/api/v3"


def find_git_owner() -> str:
    remote_url = get_remote_origin_url()
    m = GIT_URL_PARSER.match(remote_url)

    if not m:
        raise Exception(f"Unable to read git owner from {remote_url}")

    return m.group(2)


def find_git_project() -> str:
    remote_url = get_remote_origin_url()
    m = GIT_URL_PARSER.match(remote_url)

    if not m:
        raise Exception(f"Unable to read git project from {remote_url}")

    return m.group(4)


def get_remote_origin_url() -> str:
    return subprocess.check_output([
        "git", "config", "--get", "remote.origin.url",
    ], encoding="utf-8").strip()

