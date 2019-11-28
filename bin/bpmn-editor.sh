#!/usr/bin/env bash

if [ ! -f "$HOME/programs/yaoqiang-bpmn-editor-5.4.0.jar" ]; then
    pushd $HOME/programs
    wget https://jaist.dl.sourceforge.net/project/bpmn/5-GPLv3/binaries/5.4/yaoqiang-bpmn-editor-5.4.0.jar
    popd
fi # [ ! -f "$HOME/programs/yaoqiang-bpmn-editor-5.4.0" ]

silent java -jar $HOME/programs/yaoqiang-bpmn-editor-5.4.0.jar
