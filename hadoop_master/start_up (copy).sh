#!/bin/bash

: ${HADOOP_PREFIX:=/programs/hadoop}

$HADOOP_PREFIX/etc/hadoop/hadoop-env.sh

#ssh-copy-id -i /root/.ssh/id_rsa.pub root@hadoop-master 
#ssh-copy-id -i /root/.ssh/id_rsa.pub root@hadoop-slave-1 
#ssh-copy-id -i /root/.ssh/id_rsa.pub root@hadoop-slave-2

# altering the core-site configuration
#sed s/HOSTNAME/$HOSTNAME/ $HADOOP_PREFIX/etc/hadoop/core-site.xml.template > $HADOOP_PREFIX/etc/hadoop/core-site.xml

#sed -i 's/Port 22/Port 2222/' /etc/ssh/sshd_config

#echo '172.19.0.3	hadoop-slave-1' >> /etc/hosts

# start the services
service ssh start
$HADOOP_PREFIX/sbin/start-dfs.sh
$HADOOP_PREFIX/sbin/start-yarn.sh

/bin/bash
