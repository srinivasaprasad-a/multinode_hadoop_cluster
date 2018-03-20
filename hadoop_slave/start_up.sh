#!/bin/bash

: ${HADOOP_PREFIX:=/programs/hadoop}

$HADOOP_PREFIX/etc/hadoop/hadoop-env.sh

# start the services
service ssh start
$HADOOP_PREFIX/sbin/hadoop-daemon.sh start datanode
$HADOOP_PREFIX/sbin/yarn-daemons.sh start nodemanager

# run bash, so that container doesnt stop after services are started
/bin/bash

