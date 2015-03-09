#
# Run Apache Zookeeper cluster in docker
#
# Version     0.2
#

FROM huahaiy/oracle-java

MAINTAINER Huahai Yang <hyang@juji.io>

RUN \
  echo "===> download zookeeper..."  && \ 
  wget -q -O - \
  http://www.motorlogy.com/apache/zookeeper/stable/zookeeper-3.4.6.tar.gz | \   
  tar -xzf - -C /opt && \
  \
  \
  echo "===> setup zookeeper..."  && \
  cp /opt/zookeeper-3.4.6/conf/zoo_sample.cfg /opt/zookeeper-3.4.6/conf/zoo.cfg && \
  mkdir -p /tmp/zookeeper 

COPY ./docker-entrypoint.sh /

EXPOSE 2181 2888 3888

WORKDIR /opt/zookeeper-3.4.6

VOLUME ["/opt/zookeeper-3.4.6/conf", "/tmp/zookeeper"]

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["start-foreground"]

