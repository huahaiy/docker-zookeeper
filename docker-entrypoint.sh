#!/bin/bash

set -e

echo $1

if [ "$1" = 'start-foreground' ]; then

  if [ -z $ZOO_NODE_ID ] ; then
    echo 'Please specify ZOO_NODE_ID, an integer between 1 and 255'
    exit -1
  fi

  echo "$ZOO_NODE_ID" > /tmp/zookeeper/myid

  for VAR in `env`; do
    if [[ $VAR =~ ^ZOO_IP_ ]]; then
      n=`echo $VAR | sed -r "s/ZOO_IP_(.*)=.*/\1/g"`
      if [ $n -eq $ZOO_NODE_ID ]; then
        ip=`hostname -i`
      else
        ip=`echo $VAR | sed -r "s/.*=(.*)/\1/g"`
      fi
      echo "server.$n=$ip:2888:3888" >> /opt/zookeeper-3.4.6/conf/zoo.cfg
    fi
  done

  cat /opt/zookeeper-3.4.6/conf/zoo.cfg

  exec /opt/zookeeper-3.4.6/bin/zkServer.sh "$@"

fi

exec "$@"
