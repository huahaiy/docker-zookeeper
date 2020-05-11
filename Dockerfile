#
# Run Apache Zookeeper in a docker container, support cross-node cluster 
#
# Version     0.5
#

FROM huahaiy/java

MAINTAINER Huahai Yang <hyang@juji-inc.com>

RUN \
  echo "===> download zookeeper..."  && \ 
  wget -q -O - \
  http://archive.apache.org/dist/zookeeper/zookeeper-3.6.1/apache-zookeeper-3.6.1-bin.tar.gz | \
  tar -xzf - -C /opt && \
  mv /opt/apache-zookeeper-3.6.1-bin /opt/zookeeper && \
  \
  \
  echo "===> setup zookeeper..."  && \
  cp /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg && \
  mkdir -p /tmp/zookeeper 

COPY ./docker-entrypoint.sh /

EXPOSE 2181 2888 3888

WORKDIR /opt/zookeeper

VOLUME ["/opt/zookeeper/conf", "/tmp/zookeeper"]

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["start-foreground"]
