docker-zookeeper
================

Docker image for Apache ZooKeeper 3.4.10 that supports a multi-node cluster setup. 

`dataDir` is set to `/tmp/zookeeper` and is exposed as a volume, to be linked to a host directory. 

To run in a cluster, you need to set the environment variable `ZOO_NODE_ID`, and it will becomes the content of `myid` file in the container: an integer (1-255) id of this particular zookeeper node.  You also need to set the same number of `ZOO_IP_x` environment variables as the number of nodes in the cluster, in order to specify the IP addresses of all nodes, where x is the corresponding node id. These IP addresses will be properly inserted into the zookeeper config file. 

