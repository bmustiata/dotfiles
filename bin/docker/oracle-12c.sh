#!/usr/bin/env bash

sudo mkdir -p /opt/oracle-12c/oracle/
sudo chmod 777 /opt/oracle-12c/oracle/

docker run -d \
    --name oracle-12c \
    -v /opt/oracle-12c/oracle:/u01/app/oracle \
    -p 1521:1521 \
    -p 28080:8080 \
    -e CHARACTER_SET=WE8MSWIN1252 \
    -e DBCA_TOTAL_MEMORY=1024 \
    truevoly/oracle-12c

