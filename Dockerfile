
# This file is inspired by : 
# - the official doc : https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#_c_customized_image
# - this blog post : https://www.elastic.co/blog/elasticsearch-docker-plugin-management

FROM docker.elastic.co/elasticsearch/elasticsearch:6.7.0

COPY --chown=elasticsearch:elasticsearch elasticsearch.yml /usr/share/elasticsearch/config/

# Install analysis-icu plugin (usefull for Conditor app)
ARG ES_JAVA_OPTS
RUN bin/elasticsearch-plugin install analysis-icu

# Then create the /etc/ezmaster.json in your docker image.
# It will tell to ezmaster where is your web server (ex: port 3000),
# where is your JSON configuration file,
# and where is your data folder
# "configType" value can be "json" or "text" depending on your config format
RUN echo '{ \
  "httpPort": 9200, \
  "configPath": "/usr/share/elasticsearch/config/elasticsearch.yml", \
  "configType": "text", \
  "dataPath": "/usr/share/elasticsearch/data", \
  "technicalApplication": true \
}' > /etc/ezmaster.json

EXPOSE 9200

WORKDIR /
COPY --chown=elasticsearch:elasticsearch docker-entrypoint.overload.sh /usr/local/bin/

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.overload.sh" ]