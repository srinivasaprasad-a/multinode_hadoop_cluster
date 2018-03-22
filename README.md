# Multinode Hadoop Cluster on Docker

Repo to setup multi node Hadoop cluster on Docker containers

### hadoop_ubuntu
This is the base image with Hadoop 2.9 and Scala and Spark 2.2 downloaded and configured
This image is built on Ubuntu:16.06 image

### hadoop_master
This is the master node image with,

DFS Services - Namenode and Secondry Namenode

YARN Services - Resource Manager

SPARK - Executor

This image is built on above hadoop_ubuntu

### hadoop_slave
This is the slave node image with,

DFS Services - Datanode

YARN Services - Node Manager

SPARK - Worker

This image is built on above hadoop_ubuntu

Based on the hostnames given in the **slaves** file, slave nodes are defined


### Notes
Docker containers doesnt recommend SSH, but hadoop services do ssh to connect master and slave node services.

Setting SSH port to 2222 in hadoop-env.sh, and added the same port in sshd_config, but still couldnt able to ssh.

Due to unknown hosts error, had to set static IP address for each container and add other nodes IP address to hosts file.

While you try to run this on your docker instance, IP address of each container could be different, so do `docker attach <container_id>` and get IP address from `cat \etc\hosts` and update the run_all.sh file accordingly.
