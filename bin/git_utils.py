import re
import subprocess
from typing import Dict, Iterator, Set, List  # NOQA

BACKPORT_BRANCH_CHECK = re.compile(r'^.*?/\d+\.\d+(\.\d+)?/.*$')
BRANCH_NAME_PARSER = re.compile(r'(remotes/origin/)?(.+?)(/\d+\.\d+(\.\d+)?)?/(.*)$')
BRANCH_ISSUE_ID_PARSER = re.compile(r'^.+/(\w+-\d+).+?$')


def normalize_issue_name(issue_id):
    if re.compile(r'\d+').match(issue_id):
        return "WEBUI-%s" % issue_id

    return issue_id.upper()


def get_branch_name_for_different_version(existing_branch_name, version):
    m = BRANCH_NAME_PARSER.match(existing_branch_name)

    if not m:
        raise Exception("Unable to parse branch name: %s" % existing_branch_name)

    if version == "master" or version == "develop":
        return "%s/%s" % (m.group(2), m.group(5))

    return "%s/%s/%s" % (m.group(2), version, m.group(5))


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


branch_by_issue_id_cache = dict()  # type: Dict[str, str]


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

        print("Multiple branches were found for version %s, and issue %s: %s. \
               Please select the index of the branch to use." %
              (version, issue_id, branches))

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
        return 'maint/' + version

    if ('release/' + version) in all_branches():
        return 'release/' + version

    raise Exception("Unable to find a maint/%s nor a release/%s branch." % (version, version))


def get_commits_for_branch(branch_name, issue_id=None) -> List[Commit]:
    if branch_name not in all_branches():
        raise Exception("Unable to find branch: %s" % branch_name)

    git_command = ["git", "log", '--pretty=format:%H %s', "remotes/origin/" + branch_name]

    all_commits = map(lambda arr: Commit(arr[0], arr[1]),
                      map(lambda line: line.strip().split(' ', 1),
                          subprocess.check_output(git_command)
                                    .decode('utf-8')
                                    .split("\n")))

    if not issue_id:
        return list(all_commits)

    issue_id = normalize_issue_name(issue_id)

    issue_marker = re.compile('%s\W' % issue_id)  # FIXME: not so great
    merge_test = re.compile('^Merge')

    return list(filter(lambda commit: issue_marker.match(commit.message)
                       and not merge_test.match(commit.message),
                       all_commits))
