#!/usr/bin/env bash

echo "start hadoop-slave-2 container..."
sudo docker rm -f hadoop-slave-2 &> /dev/null
sudo docker run -itd \
		--net=hadoop-network \
		--ip 172.19.0.4 \
		--add-host hadoop-master:172.19.0.2 \
		--add-host hadoop-slave-1:172.19.0.3 \
		--hostname hadoop-slave-2 \
		--name hadoop-slave-2 \
		srinivasaprasada/hadoop_slave:latest &> /dev/null
echo "done."
