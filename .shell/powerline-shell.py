#!/usr/bin/python3
# -*- coding: utf-8 -*-
from __future__ import print_function

# this file was generated from https://github.com/banga/powerline-shell,
# with almost default settings (no hostname)

import argparse
import os
import sys
import subprocess
import re
import socket
import yaml

py3 = sys.version_info.major == 3
show_emojis = os.getenv('PS1_SHOW_EMOJIS', 'True').lower() in {
    "1", "true"
}


def warn(msg):
    print('[powerline-bash] ', msg)


if py3:
    def unicode(x):
        return x


class Powerline:
    symbols = {
        'compatible': {
            'lock': 'RO',
            'network': 'SSH',
            'separator': u'\u25B6',
            'separator_thin': u'\u276F'
        },
        'patched': {
            'lock': u'\uE0A2',
            'network': u'\uE0A2',
            'separator': u'\uE0B0',
            'separator_thin': u'\uE0B1'
        },
        'flat': {
            'lock': '',
            'network': '',
            'separator': '',
            'separator_thin': ''
        },
    }

    color_templates = {
        'bash': '\\[\\e%s\\]',
        'zsh': '%%{%s%%}',
        'bare': '%s',
    }

    def __init__(self, args, cwd):
        self.args = args
        self.cwd = cwd
        mode, shell = args.mode, args.shell
        self.color_template = self.color_templates[shell]
        self.reset = self.color_template % '[0m'
        self.lock = Powerline.symbols[mode]['lock']
        self.network = Powerline.symbols[mode]['network']
        self.separator = Powerline.symbols[mode]['separator']
        self.separator_thin = Powerline.symbols[mode]['separator_thin']
        # a sgement is a tuple of:
        # 0. content
        # 1. fg color
        # 2. bg color
        # 3. separator
        # 4. separator fg (defaults to bg color when missing)
        self.segments = []

    def color(self, prefix, code):
        if code is None:
            return ''
        else:
            return self.color_template % ('[%s;5;%sm' % (prefix, code))

    def fgcolor(self, code):
        return self.color('38', code)

    def bgcolor(self, code):
        return self.color('48', code)

    def append(self, content, fg, bg, separator=None, separator_fg=None):
        self.segments.append((content, fg, bg,
            separator if separator is not None else self.separator,
            separator_fg if separator_fg is not None else bg))

    def draw(self):
        text = (''.join(self.draw_segment(i) for i in range(len(self.segments)))
                + self.reset) + ' '
        if py3:
            return text
        else:
            return text.encode('utf-8')

    def draw_segment(self, idx):
        segment = self.segments[idx]
        next_segment = self.segments[idx + 1] if idx < len(self.segments)-1 else None

        return ''.join((
            self.fgcolor(segment[1]),
            self.bgcolor(segment[2]),
            segment[0],
            self.bgcolor(next_segment[2]) if next_segment and next_segment[2] >= 0 else self.reset,
            self.fgcolor(segment[4]),
            segment[3]))


class RepoStats:
    symbols = {
        'detached': u'\u2693',
        'ahead': u'\u2B06',
        'behind': u'\u2B07',
        'staged': u'\u2714',
        'not_staged': u'\u270E',
        'untracked': u'\u2753',
        'conflicted': u'\u273C'
    }

    def __init__(self):
        self.ahead = 0
        self.behind = 0
        self.untracked = 0
        self.not_staged = 0
        self.staged = 0
        self.conflicted = 0

    @property
    def dirty(self):
        qualifiers = [
            self.untracked,
            self.not_staged,
            self.staged,
            self.conflicted,
        ]
        return sum(qualifiers) > 0

    def __getitem__(self, _key):
        return getattr(self, _key)

    def n_or_empty(self, _key):
        """Given a string name of one of the properties of this class, returns
        the value of the property as a string when the value is greater than
        1. When it is not greater than one, returns an empty string.

        As an example, if you want to show an icon for untracked files, but you
        only want a number to appear next to the icon when there are more than
        one untracked files, you can do:

            segment = repo_stats.n_or_empty("untracked") + icon_string
        """
        return unicode(self[_key]) if int(self[_key]) > 1 else u''

    def add_to_powerline(self, powerline, color):
        def add(_key, fg, bg):
            if self[_key]:
                s = u"{}{} ".format(self.n_or_empty(_key), self.symbols[_key])
                powerline.append(s, fg, bg)
        add('ahead', color.GIT_AHEAD_FG, color.GIT_AHEAD_BG)
        add('behind', color.GIT_BEHIND_FG, color.GIT_BEHIND_BG)
        add('staged', color.GIT_STAGED_FG, color.GIT_STAGED_BG)
        add('not_staged', color.GIT_NOTSTAGED_FG, color.GIT_NOTSTAGED_BG)
        add('untracked', color.GIT_UNTRACKED_FG, color.GIT_UNTRACKED_BG)
        add('conflicted', color.GIT_CONFLICTED_FG, color.GIT_CONFLICTED_BG)


def get_valid_cwd():
    """ We check if the current working directory is valid or not. Typically
        happens when you checkout a different branch on git that doesn't have
        this directory.
        We return the original cwd because the shell still considers that to be
        the working directory, so returning our guess will confuse people
    """
    # Prefer the PWD environment variable. Python's os.getcwd function follows
    # symbolic links, which is undesirable. But if PWD is not set then fall
    # back to this func
    try:
        cwd = os.getenv('PWD') or os.getcwd()
    except:
        warn("Your current directory is invalid. If you open a ticket at " +
            "https://github.com/milkbikis/powerline-shell/issues/new " +
            "we would love to help fix the issue.")
        sys.stdout.write("> ")
        sys.exit(1)

    parts = cwd.split(os.sep)
    up = cwd
    while parts and not os.path.exists(up):
        parts.pop()
        up = os.sep.join(parts)
    if cwd != up:
        warn("Your current directory is invalid. Lowest valid directory: "
            + up)
    return cwd


if __name__ == "__main__":
    arg_parser = argparse.ArgumentParser()
    arg_parser.add_argument('--cwd-mode', action='store',
            help='How to display the current directory', default='fancy',
            choices=['fancy', 'plain', 'dironly'])
    arg_parser.add_argument('--cwd-only', action='store_true',
            help='Deprecated. Use --cwd-mode=dironly')
    arg_parser.add_argument('--cwd-max-depth', action='store', type=int,
            default=5, help='Maximum number of directories to show in path')
    arg_parser.add_argument('--cwd-max-dir-size', action='store', type=int,
            help='Maximum number of letters displayed for each directory in the path')
    arg_parser.add_argument('--colorize-hostname', action='store_true',
            help='Colorize the hostname based on a hash of itself.')
    arg_parser.add_argument('--mode', action='store', default='patched',
            help='The characters used to make separators between segments',
            choices=['patched', 'compatible', 'flat'])
    arg_parser.add_argument('--shell', action='store', default='bash',
            help='Set this to your shell type', choices=['bash', 'zsh', 'bare'])
    arg_parser.add_argument('prev_error', nargs='?', type=int, default=0,
            help='Error code returned by the last command')
    args = arg_parser.parse_args()

    powerline = Powerline(args, get_valid_cwd())


class DefaultColor:
    """
    This class should have the default colors for every segment.
    Please test every new segment with this theme first.
    """
    USERNAME_FG = 250
    USERNAME_BG = 240
    USERNAME_ROOT_BG = 124

    HOSTNAME_FG = 250
    HOSTNAME_BG = 238

    HOME_SPECIAL_DISPLAY = True
    HOME_BG = 31  # blueish
    HOME_FG = 15  # white
    PATH_BG = 237  # dark grey
    PATH_FG = 250  # light grey
    CWD_FG = 254  # nearly-white grey
    SEPARATOR_FG = 244

    READONLY_BG = 124
    READONLY_FG = 254

    SSH_BG = 166 # medium orange
    SSH_FG = 254

    REPO_CLEAN_BG = 22  # a dark green color
    REPO_CLEAN_FG = 15  # white
    REPO_DIRTY_BG = 52  # red
    REPO_DIRTY_FG = 15  # white

    JOBS_FG = 39
    JOBS_BG = 238

    CMD_PASSED_BG = 236
    CMD_PASSED_FG = 15
    CMD_FAILED_BG = 131
    CMD_FAILED_FG = 15

    SVN_CHANGES_BG = 148
    SVN_CHANGES_FG = 22  # dark green

    GIT_AHEAD_BG = 240
    GIT_AHEAD_FG = 250
    GIT_BEHIND_BG = 240
    GIT_BEHIND_FG = 250
    GIT_STAGED_BG = 22
    GIT_STAGED_FG = 15
    GIT_NOTSTAGED_BG = 136
    GIT_NOTSTAGED_FG = 15
    GIT_UNTRACKED_BG = 52
    GIT_UNTRACKED_FG = 15
    GIT_CONFLICTED_BG = 9
    GIT_CONFLICTED_FG = 15

    VIRTUAL_ENV_BG = 77
    VIRTUAL_ENV_FG = 16
    JAVA_ENV_BG = 35
    JAVA_ENV_FG = 00
    KUBE_ENV_BG = 74
    KUBE_ENV_FG = 0

class Color(DefaultColor):
    """
    This subclass is required when the user chooses to use 'default' theme.
    Because the segments require a 'Color' class for every theme.
    """
    pass


def add_enter_segment(powerline):
    powerline.append('\n', -1, -1, "", "")


def add_virtual_env_segment(powerline):
    if not os.getenv('PS1_SHOW_PYTHON'):
        return

    env = os.getenv('VIRTUAL_ENV') or os.getenv('CONDA_ENV_PATH')

    if env is None:
        env_name = "default"
    else:
        env_name = os.path.basename(env)

    bg = Color.VIRTUAL_ENV_BG
    fg = Color.VIRTUAL_ENV_FG
    icon = u'🐍 ' if show_emojis else ''
    powerline.append(u'%s%s' % (icon, env_name), fg, bg)

    return True


def readlink(path):
    if os.path.islink(path):
        return os.readlink(path)

    return path


def add_java_segment(powerline):
    if not os.getenv('PS1_SHOW_JAVA'):
        return

    env = os.getenv('JAVA_HOME')

    if env is None:
        return False

    env_name = os.path.basename(readlink(env))

    bg = Color.JAVA_ENV_BG
    fg = Color.JAVA_ENV_FG
    icon = u'☕ ' if show_emojis else ''
    powerline.append(u'%s%s ' % (icon, env_name), fg, bg)

    return True


def add_kubernetes_segment(powerline):
    if not os.getenv('PS1_SHOW_KUBERNETES'):
        return

    home_folder = os.getenv('HOME')

    if not home_folder:
        return

    kube_config = os.path.join(home_folder, '.kube', 'config')
    if not os.path.exists(kube_config):
        return

    with open(kube_config, 'r') as f:
        for line in f:
            if not line.startswith("current-context: "):
                continue

            line = line.strip()

            bg = Color.KUBE_ENV_BG
            fg = Color.KUBE_ENV_FG
            kube_context = line[17:]

            if ":" in kube_context:
                kube_context = kube_context.split(":")[0]

            # FIXME: too specific
            kube_context = kube_context.replace('-broadcom-com', '')
            kube_context = kube_context.replace('openshift-infra-', '')

            icon = u'📦 ' if show_emojis else ''
            powerline.append(u'%s%s' % (icon, kube_context), fg, bg)

            return True


def add_kubehost_segment(powerline):
    if not os.getenv('PS1_SHOW_KUBEHOST'):
        return

    kubehost = os.getenv('CIPLOGIC_ARCHER_CURRENT_KUBEHOST')

    if not kubehost:
        return

    bg = Color.KUBE_ENV_BG
    fg = Color.KUBE_ENV_FG
    icon = u'☁️ ' if show_emojis else ''
    powerline.append(u'%s%s' % (icon, kubehost), fg, bg)

    return True


def add_jee_segment(powerline):
    if not os.getenv('PS1_SHOW_JEE_SERVER'):
        return

    jee_server = os.getenv('CIPLOGIC_ARCHER_CURRENT_SERVER')

    if not jee_server:
        return

    bg = Color.KUBE_ENV_BG
    fg = Color.KUBE_ENV_FG
    icon = u'🐅 ' if show_emojis else ''
    powerline.append(u'%s%s' % (icon, jee_server), fg, bg)

    return True


kube_config_data = None


def read_kube_config():
    global kube_config_data

    if kube_config_data:
        return kube_config_data

    kubeconfig = os.environ.get(
        "KUBECONFIG",
        os.path.join(os.getenv('HOME'), '.kube', 'config'))

    if not os.path.exists(kubeconfig):
        return None

    with open(kubeconfig, 'r') as f:
        kube_config_data = yaml.safe_load(f)
        return kube_config_data


def add_kubernetes_namespace_segment(powerline):
    if not os.getenv('PS1_SHOW_KUBERNETES_NAMESPACE'):
        return

    data = read_kube_config()

    if not data:
        return

    bg = Color.KUBE_ENV_BG
    fg = Color.KUBE_ENV_FG
    icon = u'📦 ' if show_emojis else ''

    try:
        try:
            current_context = data['current-context']

            for context in data['contexts']:
                if context['name'] != current_context:
                    continue

                namespace = context['context'].get('namespace', 'default')
                powerline.append(u'%s%s' % (icon, namespace), fg, bg)

                break

        except Exception:
            powerline.append(u'%s%s' % (icon, "??"), fg, bg)

        return True
    except Exception:
        powerline.append(u'%s%s' % (icon, '<config-read-error>'), fg, bg)


def add_kubernetes_user_segment(powerline):
    if not os.getenv('PS1_SHOW_KUBERNETES_USER'):
        return

    data = read_kube_config()

    if not data:
        return

    current_context = data["current-context"]
    kube_user = "??"  # os.getenv('KUBERNETES_SERVICE_ACCOUNT')
    for context in data["contexts"]:
        if context["name"] == current_context:
            kube_user = context["context"]["user"]
            break

    if not kube_user:
        return

    m = re.compile(r'([^/]+)(/.*$)?').match(kube_user)
    kube_user = m[1]

    bg = Color.KUBE_ENV_BG
    fg = Color.KUBE_ENV_FG
    icon = u'👤' if show_emojis else ''
    powerline.append(u'%s%s' % (icon, kube_user), fg, bg)

    return True


def add_archer_segment(powerline):
    if not os.getenv('PS1_SHOW_PROJECT'):
        return

    project = os.getenv('CIPLOGIC_ARCHER_CURRENT_PROJECT')

    if not project:
        return

    bg = Color.KUBE_ENV_BG
    fg = Color.KUBE_ENV_FG
    icon = u'🚧 ' if show_emojis else ''
    powerline.append(u'%s%s' % (icon, project), fg, bg)

    return True


def add_username_segment(powerline):
    if powerline.args.shell == 'bash':
        user_prompt = '\\u'
    elif powerline.args.shell == 'zsh':
        user_prompt = '%n '
    else:
        user_prompt = '%s' % os.getenv('USER')

    if os.getenv('USER') == 'root':
        bgcolor = Color.USERNAME_ROOT_BG
    else:
        bgcolor = Color.USERNAME_BG

    powerline.append(user_prompt, Color.USERNAME_FG, bgcolor)

    return True


def add_hostname_segment(powerline):
    hostname = socket.gethostname()

    if not hostname:
        return

    powerline.append("@" + hostname, Color.HOSTNAME_FG, Color.HOSTNAME_BG)

    return True


def add_ssh_segment(powerline):
    if os.getenv('SSH_CLIENT'):
        powerline.append(' %s ' % powerline.network, Color.SSH_FG, Color.SSH_BG)
        return True


ELLIPSIS = u'\u2026'


def replace_home_dir(cwd):
    home = os.getenv('HOME')
    if cwd.startswith(home):
        return '~' + cwd[len(home):]
    return cwd


def split_path_into_names(cwd):
    names = cwd.split(os.sep)

    if names[0] == '':
        names = names[1:]

    if not names[0]:
        return ['/']

    return names


def requires_special_home_display(name):
    """Returns true if the given directory name matches the home indicator and
    the chosen theme should use a special home indicator display."""
    return (name == '~' and Color.HOME_SPECIAL_DISPLAY)


def maybe_shorten_name(powerline, name):
    """If the user has asked for each directory name to be shortened, will
    return the name up to their specified length. Otherwise returns the full
    name."""
    if powerline.args.cwd_max_dir_size:
        return name[:powerline.args.cwd_max_dir_size]
    return name


def get_fg_bg(name):
    """Returns the foreground and background color to use for the given name.
    """
    if requires_special_home_display(name):
        return (Color.HOME_FG, Color.HOME_BG,)
    return (Color.PATH_FG, Color.PATH_BG,)


def add_cwd_segment(powerline):
    cwd = powerline.cwd or os.getenv('PWD')
    if not py3:
        cwd = cwd.decode("utf-8")
    cwd = replace_home_dir(cwd)

    if powerline.args.cwd_mode == 'plain':
        powerline.append('%s' % (cwd,), Color.CWD_FG, Color.PATH_BG)
        return

    names = split_path_into_names(cwd)

    max_depth = powerline.args.cwd_max_depth
    if max_depth <= 0:
        warn("Ignoring --cwd-max-depth argument since it's not greater than 0")
    elif len(names) > max_depth:
        # https://github.com/milkbikis/powerline-shell/issues/148
        # n_before is the number is the number of directories to put before the
        # ellipsis. So if you are at ~/a/b/c/d/e and max depth is 4, it will
        # show `~ a ... d e`.
        #
        # max_depth must be greater than n_before or else you end up repeating
        # parts of the path with the way the splicing is written below.
        n_before = 2 if max_depth > 2 else max_depth - 1
        names = names[:n_before] + [ELLIPSIS] + names[n_before - max_depth:]

    if (powerline.args.cwd_mode == 'dironly' or powerline.args.cwd_only):
        # The user has indicated they only want the current directory to be
        # displayed, so chop everything else off
        names = names[-1:]

    for i, name in enumerate(names):
        fg, bg = get_fg_bg(name)

        # Looks bad, don't know why. I'm more used to paths as paths.
        #separator = powerline.separator_thin
        separator = '/'
        separator_fg = Color.SEPARATOR_FG
        is_last_dir = (i == len(names) - 1)
        if requires_special_home_display(name) or is_last_dir:
            separator = None
            separator_fg = None

        powerline.append('%s' % maybe_shorten_name(powerline, name), fg, bg,
                         separator, separator_fg)
    return True


def add_read_only_segment(powerline):
    cwd = powerline.cwd or os.getenv('PWD')

    if not os.access(cwd, os.W_OK):
        powerline.append(' %s ' % powerline.lock, Color.READONLY_FG, Color.READONLY_BG)

    return True


def get_PATH():
    """Normally gets the PATH from the OS. This function exists to enable
    easily mocking the PATH in tests.
    """
    return os.getenv("PATH")

def git_subprocess_env():
    return {
        # LANG is specified to ensure git always uses a language we are expecting.
        # Otherwise we may be unable to parse the output.
        "LANG": "C",

        # https://github.com/milkbikis/powerline-shell/pull/126
        "HOME": os.getenv("HOME"),

        # https://github.com/milkbikis/powerline-shell/pull/153
        "PATH": get_PATH(),
    }


def parse_git_branch_info(status):
    info = re.search('^## (?P<local>\S+?)''(\.{3}(?P<remote>\S+?)( \[(ahead (?P<ahead>\d+)(, )?)?(behind (?P<behind>\d+))?\])?)?$', status[0])
    return info.groupdict() if info else None


def _get_git_detached_branch():
    p = subprocess.Popen(['git', 'describe', '--tags', '--always'],
                         stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                         env=git_subprocess_env())
    detached_ref = p.communicate()[0].decode("utf-8").rstrip('\n')
    if p.returncode == 0:
        branch = u'{} {}'.format(RepoStats.symbols['detached'], detached_ref)
    else:
        branch = 'Big Bang'
    return branch


def parse_git_stats(status):
    stats = RepoStats()
    for statusline in status[1:]:
        code = statusline[:2]
        if code == '??':
            stats.untracked += 1
        elif code in ('DD', 'AU', 'UD', 'UA', 'DU', 'AA', 'UU'):
            stats.conflicted += 1
        else:
            if code[1] != ' ':
                stats.not_staged += 1
            if code[0] != ' ':
                stats.staged += 1

    return stats


def add_git_segment(powerline):
    if not os.getenv('PS1_SHOW_GIT'):
        return

    try:
        p = subprocess.Popen(['git', 'status', '--porcelain', '-b'],
                             stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                             env=git_subprocess_env())
    except OSError:
        # Popen will throw an OSError if git is not found
        return

    pdata = p.communicate()
    if p.returncode != 0:
        return

    status = pdata[0].decode("utf-8").splitlines()
    stats = parse_git_stats(status)
    branch_info = parse_git_branch_info(status)

    if branch_info:
        stats.ahead = branch_info["ahead"]
        stats.behind = branch_info["behind"]
        branch = branch_info['local']
    else:
        branch = _get_git_detached_branch()

    bg = Color.REPO_CLEAN_BG
    fg = Color.REPO_CLEAN_FG
    if stats.dirty:
        bg = Color.REPO_DIRTY_BG
        fg = Color.REPO_DIRTY_FG

    icon = u'🐙 ' if show_emojis else ''
    powerline.append(u'%s%s' % (icon, branch), fg, bg)
    stats.add_to_powerline(powerline, Color)

    return True


def get_hg_status():
    has_modified_files = False
    has_untracked_files = False
    has_missing_files = False

    p = subprocess.Popen(['hg', 'status'], stdout=subprocess.PIPE)
    output = p.communicate()[0].decode("utf-8")

    for line in output.split('\n'):
        if line == '':
            continue
        elif line[0] == '?':
            has_untracked_files = True
        elif line[0] == '!':
            has_missing_files = True
        else:
            has_modified_files = True
    return has_modified_files, has_untracked_files, has_missing_files


def add_hg_segment(powerline):
    branch = os.popen('hg branch 2> /dev/null').read().rstrip()
    if len(branch) == 0:
        return False
    bg = Color.REPO_CLEAN_BG
    fg = Color.REPO_CLEAN_FG
    has_modified_files, has_untracked_files, has_missing_files = get_hg_status()
    if has_modified_files or has_untracked_files or has_missing_files:
        bg = Color.REPO_DIRTY_BG
        fg = Color.REPO_DIRTY_FG
        extra = ''
        if has_untracked_files:
            extra += '+'
        if has_missing_files:
            extra += '!'
        branch += (' ' + extra if extra != '' else '')
    return powerline.append(' %s ' % branch, fg, bg)

# =====================================================
# Mercurial is actually way too slow.
# =====================================================
# add_hg_segment(powerline)


def _add_svn_segment(powerline):
    is_svn = subprocess.Popen(['svn', 'status'],
                              stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    is_svn_output = is_svn.communicate()[1].decode("utf-8").strip()
    if len(is_svn_output) != 0:
        return

    #"svn status | grep -c "^[ACDIMRX\\!\\~]"
    p1 = subprocess.Popen(['svn', 'status'], stdout=subprocess.PIPE,
            stderr=subprocess.PIPE)
    p2 = subprocess.Popen(['grep', '-c', '^[ACDIMR\\!\\~]'],
            stdin=p1.stdout, stdout=subprocess.PIPE)
    output = p2.communicate()[0].decode("utf-8").strip()
    if len(output) > 0 and int(output) > 0:
        changes = output.strip()
        powerline.append(' %s ' % changes, Color.SVN_CHANGES_FG, Color.SVN_CHANGES_BG)


def add_svn_segment(powerline):
    """Wraps _add_svn_segment in exception handling."""

    # FIXME This function was added when introducing a testing framework,
    # during which the 'powerline' object was passed into the
    # `add_[segment]_segment` functions instead of being a global variable. At
    # that time it was unclear whether the below exceptions could actually be
    # thrown. It would be preferable to find out whether they ever will. If so,
    # write a comment explaining when. Otherwise remove.

    try:
        _add_svn_segment(powerline)
        return True
    except OSError:
        pass
    except subprocess.CalledProcessError:
        pass


def add_jobs_segment(powerline):
    pppid_proc = subprocess.Popen(['ps', '-p', str(os.getppid()), '-oppid='],
                                  stdout=subprocess.PIPE)
    pppid = pppid_proc.communicate()[0].decode("utf-8").strip()

    output_proc = subprocess.Popen(['ps', '-a', '-o', 'ppid'],
                                   stdout=subprocess.PIPE)
    output = output_proc.communicate()[0].decode("utf-8")

    num_jobs = len(re.findall(str(pppid), output)) - 1

    if num_jobs > 0:
        powerline.append(' %d ' % num_jobs, Color.JOBS_FG, Color.JOBS_BG)
        return True


def add_root_segment(powerline):
    root_indicators = {
        'bash': '\\$',
        'zsh': '%#',
        'bare': '$',
    }
    bg = Color.CMD_PASSED_BG
    fg = Color.CMD_PASSED_FG
    if powerline.args.prev_error != 0:
        fg = Color.CMD_FAILED_FG
        bg = Color.CMD_FAILED_BG
    powerline.append(root_indicators[powerline.args.shell], fg, bg)


# ####################################################################
# segment building
# ####################################################################
try:
    add_enter_segment(powerline)
    add_enter_segment(powerline)

    # kubernetes
    segment_content = False
    segment_content = add_kubehost_segment(powerline) or segment_content
    segment_content = add_kubernetes_namespace_segment(powerline) or segment_content
    segment_content = add_kubernetes_user_segment(powerline) or segment_content
    if segment_content:
        add_enter_segment(powerline)

    # project/git
    segment_content = False
    segment_content = add_virtual_env_segment(powerline) or segment_content
    segment_content = add_jee_segment(powerline) or segment_content
    segment_content = add_java_segment(powerline) or segment_content
    segment_content = add_git_segment(powerline) or segment_content
    # segment_content = add_svn_segment(powerline) or segment_content
    segment_content = add_jobs_segment(powerline) or segment_content
    if segment_content:
        add_enter_segment(powerline)

    # shell command
    segment_content = add_archer_segment(powerline) or segment_content
    segment_content = add_username_segment(powerline) or segment_content
    segment_content = add_ssh_segment(powerline) or segment_content
    segment_content = add_cwd_segment(powerline) or segment_content
    segment_content = add_read_only_segment(powerline) or segment_content
    add_root_segment(powerline)
except Exception as e:
    sys.stdout.write(str(e) + " $")
    sys.exit(0)

sys.stdout.write(powerline.draw())
