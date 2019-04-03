
# This file is inspired by : 
# - the official doc : https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#_c_customized_image
# - this blog post : https://www.elastic.co/blog/elasticsearch-docker-plugin-management

FROM docker.elastic.co/elasticsearch/elasticsearch:6.7.0

COPY --chown=elasticsearch:elasticsearch elasticsearch.yml /usr/share/elasticsearch/config/

ARG ES_JAVA_OPTS

RUN bin/elasticsearch-plugin install analysis-icu