import adhesive


@adhesive.task('Install vim package')
def install_vim_package(context):
    pass


@adhesive.task('Vundle init')
def vundle_init(context):
    context.workspace.run("""
        if [ ! -d $HOME/.vim/bundle/Vundle.vim ]; then
            cd $HOME/.vim/
            ./vundleinit.sh
        fi
    """)


@adhesive.task('Install vundle packages')
def install_vundle_packages(context):
    context.workspace.run('vim "+silent! PluginInstall" +qall')


@adhesive.task('YouCompleteMe Post Install')
def youcompleteme_post_install(context):
    context.workspace.run("""
        cd $HOME/.vim/bundle/YouCompleteMe
        ./install.sh
    """)


@adhesive.task('Install fonts')
def install_fonts(context):
    pass


adhesive.bpmn_build("install-vim.bpmn")
