#!/usr/bin/env python3

import adhesive
from adhesive.workspace import ssh
import uuid


@adhesive.usertask("SSH Credentials")
def ssh_credentials(context, ui):
    ui.add_input_text("ssh_host", title="Host", value="localhost")
    ui.add_input_text("ssh_port", title="Port", value="22")
    ui.add_input_text("ssh_user", title="User")
    ui.add_input_password("ssh_pass", title="Pass")


@adhesive.task('Copy the id_rsa.pub over there')
def copy_idrsa_pub(context):
    content = context.workspace.run("""
        cat /home/raptor/.ssh/id_rsa.pub
    """, capture_stdout=True)

    with ssh.inside(
            context.workspace,
            context.data.ssh_host,
            port=context.data.ssh_port,
            username=context.data.ssh_user,
            password=context.data.ssh_pass,
        ) as ssh_workspace:

        temp_file_name = f"/tmp/{str(uuid.uuid4())}"
        try:
            ssh_workspace.write_file(temp_file_name, content)
            ssh_workspace.run(f"""
                cd $HOME
                mkdir -p .ssh
                cd .ssh
                chmod 711 .
                cat {temp_file_name} >> authorized_keys
                chmod 600 authorized_keys
            """)
        finally:
            ssh_workspace.rm(temp_file_name)


adhesive.build()
