#!/usr/bin/env python3

import adhesive
import adhesive.workspace.ssh

# FIXME: not done
# FIXME: imlement in-place editing


class Data:
    host: str
    port: str
    username: str
    password: str


@adhesive.lane('ssh')
def execute_remote_command(token: adhesive.Token[Data]):
    with adhesive.workspace.ssh.inside(
                token.workspace,
                token.data.host,
                username=token.data.username,
                password=token.data.password,
            ) as ssh_workspace:
        yield ssh_workspace


@adhesive.usertask('Host Details')
def ui_host_details(token: adhesive.Token[Data], ui: adhesive.UI):
    ui.add_input_text("host")
    ui.add_input_text("port", value="22")
    ui.add_input_text("username", value="root")
    ui.add_input_text("password")


adhesive.process_start()\
    .task("Read user data")\
    .user_task("Host Details", when="user_details_missing")\
    .task("Ensure host is in authorized_keys")\
    .branch_start()\
        .sub_process_start("Add keys to the host")\
            .task("Obtain current public key")\
            .task("Ensure public key is registered remotely", lane="ssh")\
        .sub_process_end()\
    .branch_end()\
    .branch_start().task("Ensure the user can login without pass", lane="ssh").branch_end()\
    .branch_start().task("Ensure the user is in sudoers group", lane="ssh").branch_end()\
    .branch_start().task("Ensure the right python is installed").branch_end()\
    .process_end()\
    .build()
