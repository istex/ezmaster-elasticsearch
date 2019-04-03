#!/bin/bash

# start cerebro GUI
# cd /usr/share/cerebro && bin/cerebro -Dhttp.port=9000 &

# start home page
cd /www && python -m SimpleHTTPServer 9000 &

# start elasticsearch
exec /usr/local/bin/docker-entrypoint.sh $@
