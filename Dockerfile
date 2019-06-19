FROM docker.elastic.co/elasticsearch/elasticsearch:5.5.3

COPY elasticsearch.yml /usr/share/elasticsearch/config/
COPY docker-entrypoint.overload.sh /usr/share/elasticsearch/

# Install analysis-icu plugin (usefull for Conditor app)

USER root

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

RUN chmod -R 1777 /tmp
RUN usermod -a -G root elasticsearch

# USER elasticsearch 

EXPOSE 9200

WORKDIR /usr/share/elasticsearch

ENTRYPOINT [ "./docker-entrypoint.overload.sh" ]