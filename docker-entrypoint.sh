#!/bin/bash

set -e

if [ "$1" = 'start-foreground' ]; then

  ZOO_NODE_ID=${ZOO_NODE_ID:-"1"}

  echo "$ZOO_NODE_ID" > /tmp/zookeeper/myid

  for VAR in `env`; do
    if [[ $VAR =~ ^ZOO_IP_ ]]; then
      n=`echo $VAR | sed -r "s/ZOO_IP_(.*)=.*/\1/g"`
      if [ $n -eq $ZOO_NODE_ID ]; then
        ip=`hostname -i`
      else
        ip=`echo $VAR | sed -r "s/.*=(.*)/\1/g"`
      fi
      echo "server.$n=$ip:2888:3888" >> /opt/zookeeper/conf/zoo.cfg
    fi
  done

  cat /opt/zookeeper/conf/zoo.cfg

  exec /opt/zookeeper/bin/zkServer.sh "$@"

fi

exec "$@"
