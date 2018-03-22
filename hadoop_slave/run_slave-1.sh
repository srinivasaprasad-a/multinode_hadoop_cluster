#!/usr/bin/env bash

echo "start hadoop-slave-1 container..."
sudo docker rm -f hadoop-slave-1 &> /dev/null
sudo docker run -itd \
		--net=hadoop-network \
		--ip 172.19.0.3 \
		--add-host hadoop-master:172.19.0.2 \
		--add-host hadoop-slave-2:172.19.0.4 \
		--hostname hadoop-slave-1 \
		--name hadoop-slave-1 \
		srinivasaprasada/hadoop_slave:latest &> /dev/null
echo "done."
