#
# Run Apache Zookeeper cluster in docker
#
# Version     0.1
#

FROM huahaiy/oracle-java

MAINTAINER Huahai Yang <hyang@juji.io>

RUN \
  echo "===> download zookeeper..."  && \ 
  wget -O /tmp/zookeeper.tgz \
  http://www.motorlogy.com/apache/zookeeper/stable/zookeeper-3.4.6.tar.gz && \   
  \
  \
  echo "===> install zookeeper..."  && \ 
  tar xfz /tmp/zookeeper.tgz -C /opt && \
  rm /tmp/zookeeper.tgz && \
  \
  \
  echo "===> setup zookeeper..."  && \
  cp /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg && \
  mkdir -p /tmp/zookeeper 

EXPOSE 2181 2888 3888

WORKDIR /opt/zookeeper

VOLUME ["/opt/zookeeper", "/tmp/zookeeper"]

ENTRYPOINT ["/opt/zookeeper/bin/zkServer.sh"]

CMD ["start-foreground"]
