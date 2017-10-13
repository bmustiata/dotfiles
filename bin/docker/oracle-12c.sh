#!/usr/bin/env bash

docker run -d \
    --name oracle-12c \
    -v /opt/oracle-12c:/u01/app/oracle \
    -p 1521:1521 \
    -p 28080:8080 \
    -e CHARACTER_SET=WE8ISO8859P1 \
    -e DBCA_TOTAL_MEMORY=1024 \
    sath89/oracle-12c

