FROM gliderlabs/alpine:3.3

RUN apk update && \
    apk add --update tar supervisor openjdk8 wget

# Download Fuseki:
ENV FUSEKI_VERSION 2.4.1
ENV FUSEKI_HOME /usr/lib/fuseki
RUN wget http://mirror.dkd.de/apache/jena/binaries/apache-jena-fuseki-$FUSEKI_VERSION.tar.gz && \
    tar -zxvf apache-jena-fuseki-$FUSEKI_VERSION.tar.gz && \
    rm apache-jena-fuseki-$FUSEKI_VERSION.tar.gz && \
    mv apache-jena-fuseki-$FUSEKI_VERSION $FUSEKI_HOME
ENV PATH $PATH:FUSEKI_HOME/bin

# Persist data of Fuseki server:
VOLUME /data
# Persist log files:
VOLUME $FUSEKI_HOME/run/logs

# Open default port of Fuseki:
EXPOSE 3030

COPY ./supervisord.conf /etc/supervisord.conf
COPY ./log4j.properties $FUSEKI_HOME/log4j.properties
COPY ./config.ttl /config.ttl
COPY ./start.sh /start.sh
COPY ./shiro.ini $FUSEKI_HOME/run/shiro.ini
CMD ["/usr/bin/supervisord"]
