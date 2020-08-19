#!/usr/bin/env python3

import adhesive


@adhesive.task('Install packages')
def install_packages(context):
    context.workspace.run(f"""
        sudo apt-get install -y jq dateutils vim neovim zip unzip curl
    """)


@adhesive.task('Install nodejs')
def install_nodejs(context):
    # check nvm if it exists:
    try:
        context.workspace.run("""
            ls $HOME/.nvm
        """)
    except Exception:
        # we don't have NVM installed, we need to install it first
        context.workspace.run("""
            wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash
        """)

    # check if node exists
    try:
        context.workspace.run("""
            export NVM_DIR="$HOME/.nvm"
            [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
            node --version
        """)
    except Exception as e:
        print("node is not installed, installing now")
        context.workspace.run(
            """
                export NVM_DIR="$HOME/.nvm"
                [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
                nvm install v12
            """,
            shell="/bin/bash",
        )

    context.data.node_global_packages = [
        "fast-live-reload",
        "js-beautify",
        "eslint", "eslint-plugin-import", "eslint-config-airbnb-base",
        "hexo"
    ]


@adhesive.task('Install npm')
def install_npm(context):
    context.workspace.run(f"""
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
        #npm install -g npm
    """)


@adhesive.task('Install nodejs app: {loop.value}', loop="node_global_packages")
def install_node_apps(context):
    context.workspace.run(f"""
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
        echo npm install -g {context.loop.value}
        npm install -g {context.loop.value}
    """,
    shell="/bin/bash")


@adhesive.task('Install SDKMAN')
def install_sdkman(context):
    try:  # check if SDKMAN is installed
        context.workspace.run("""
            ls -l $HOME/.sdkman
        """)
    except Exception as e:
        context.workspace.run("""
            curl -s "https://get.sdkman.io" | bash
        """)


@adhesive.task(re='^Install java (.*?)$')
def install_java(context, java_version):
    found_java_version = context.workspace.run_output(
        f"""
            export SDKMAN_DIR="/home/raptor/.sdkman"
            [[ -s "/home/raptor/.sdkman/bin/sdkman-init.sh" ]] && . "/home/raptor/.sdkman/bin/sdkman-init.sh"

            sdk list java | grep adpt | grep " {java_version}.0" | grep ".j9 " | tr -s " " | cut -f6 -d\\|
        """,
        shell="/bin/bash",
    ).strip()

    print(f"Target java ({java_version}): {found_java_version}")

    try:
        context.workspace.run(
            f"""
                export SDKMAN_DIR="/home/raptor/.sdkman"
                [[ -s "/home/raptor/.sdkman/bin/sdkman-init.sh" ]] && . "/home/raptor/.sdkman/bin/sdkman-init.sh"

                sdk list java | grep {found_java_version} | grep ' installed '
            """,
            shell="/bin/bash",
        )
        is_java_installed = True
    except Exception:
        is_java_installed = False

    if not is_java_installed:
        context.workspace.run(
            f"""
                export SDKMAN_DIR="/home/raptor/.sdkman"
                [[ -s "/home/raptor/.sdkman/bin/sdkman-init.sh" ]] && . "/home/raptor/.sdkman/bin/sdkman-init.sh"

                sdk install java {found_java_version}
            """,
            shell="/bin/bash",
        )

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!



adhesive.process_start()\
    .branch_start()\
        .task('Install packages')\
        .task('Install SDKMAN')\
        .task('Install java 8')\
        .task('Install java 11')\
    .branch_end()\
    .branch_start()\
        .task('Install nodejs')\
        .task('Install npm')\
        .task('Install nodejs app: {loop.value}', loop="node_global_packages")\
    .branch_end()\
    .process_end()\
    .build()

