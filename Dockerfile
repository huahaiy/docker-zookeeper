#
# Run Apache Zookeeper in a docker container, support cross-node cluster 
#
# Version     0.3
#

FROM huahaiy/oracle-java

MAINTAINER Huahai Yang <hyang@juji-inc.com>

RUN \
  echo "===> download zookeeper..."  && \ 
  wget -q -O - \
  http://mirror.reverse.net/pub/apache/zookeeper/zookeeper-3.4.10/zookeeper-3.4.10.tar.gz | \
  tar -xzf - -C /opt && \
  \
  \
  echo "===> setup zookeeper..."  && \
  cp /opt/zookeeper-3.4.10/conf/zoo_sample.cfg /opt/zookeeper-3.4.10/conf/zoo.cfg && \
  mkdir -p /tmp/zookeeper 

COPY ./docker-entrypoint.sh /

EXPOSE 2181 2888 3888

WORKDIR /opt/zookeeper-3.4.10

VOLUME ["/opt/zookeeper-3.4.10/conf", "/tmp/zookeeper"]

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["start-foreground"]
