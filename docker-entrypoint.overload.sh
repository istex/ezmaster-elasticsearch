#!/bin/bash

# start elasticsearch
chmod -R 1777 /tmp

su - elasticsearch -c /usr/share/elasticsearch/bin/es-docker $@