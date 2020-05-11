#
# Run Apache Zookeeper in a docker container, support cross-node cluster 
#
# Version     0.5
#

FROM huahaiy/oracle-java

MAINTAINER Huahai Yang <hyang@juji-inc.com>

RUN \
  echo "===> download zookeeper..."  && \ 
  wget -q -O - \
  http://archive.apache.org/dist/zookeeper/zookeeper-3.6.1/apache-zookeeper-3.6.1-bin.tar.gz | \
  tar -xzf - -C /opt && \
  \
  \
  echo "===> setup zookeeper..."  && \
  cp /opt/apache-zookeeper-3.6.1-bin/conf/zoo_sample.cfg /opt/apache-zookeeper-3.6.1-bin/conf/zoo.cfg && \
  mkdir -p /tmp/zookeeper 

COPY ./docker-entrypoint.sh /

EXPOSE 2181 2888 3888

WORKDIR /opt/apache-zookeeper-3.6.1-bin

VOLUME ["/opt/apache-zookeeper-3.6.1-bin/conf", "/tmp/zookeeper"]

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["start-foreground"]
