#!/bin/bash

# start elasticsearch
chmod -R 1777 /tmp
export ES_JAVA_OPTS="-Xms1g -Xmx1g"
su -m - elasticsearch -c /usr/share/elasticsearch/bin/elasticsearch $@