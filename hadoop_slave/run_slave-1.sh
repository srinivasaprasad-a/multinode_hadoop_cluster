sudo docker rm -f hadoop-slave-1 &> /dev/null
sudo docker run -it \
                -p 50075:5001 \
                -p 8042:4001 \
		--net=hadoop-network \
		--ip 172.19.0.3 \
		--add-host hadoop-master:172.19.0.2 \
		--add-host hadoop-slave-2:172.19.0.4 \
		--hostname hadoop-slave-1 \
		--name hadoop-slave-1 \
		hadoop_slave:latest &> /dev/null
