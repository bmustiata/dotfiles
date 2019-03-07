#!/usr/bin/env bash

hexo generate
ansible-playbook -i /home/raptor/learn/learn/adoc/inventory bin/publish.yml
git add . && git commit -m "new article" && git push
