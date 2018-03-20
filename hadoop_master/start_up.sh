#!/bin/bash

: ${HADOOP_PREFIX:=/programs/hadoop}

$HADOOP_PREFIX/etc/hadoop/hadoop-env.sh

# start the services
service ssh start
$HADOOP_PREFIX/sbin/start-dfs.sh
$HADOOP_PREFIX/sbin/start-yarn.sh

# run bash, so that container doesnt stop after services are started
/bin/bash
