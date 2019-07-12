#!/usr/bin/env bash

if [ ! -f "$HOME/programs/yaoqiang-bpmn-editor-5.3.12.jar" ]; then
    pushd $HOME/programs
    wget https://jaist.dl.sourceforge.net/project/bpmn/5-GPLv3/binaries/5.3/yaoqiang-bpmn-editor-5.3.12.jar
    popd
fi # [ ! -f "$HOME/programs/yaoqiang-bpmn-editor-5.3.12" ]

silent java -jar $HOME/programs/yaoqiang-bpmn-editor-5.3.12.jar
