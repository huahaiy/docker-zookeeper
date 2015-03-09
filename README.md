docker-zookeeper
================

Docker image for Apache ZooKeeper 3.4.6

`dataDir` is set to `/tmp/zookeeper` and is exposed as a volume, to be linked to a host directory. 

You need to set the environment variable `ZOO_NODE_ID` and it will becomes the content of `myid` file, indicating the integer id of this particular zookeeper node. 

Finally, you need to set the same number of `ZOO_IP_x` environment variables as the number of nodes in the cluster, in order to specify the IP addresses of all nodes, where x is the corresponding node id. 
