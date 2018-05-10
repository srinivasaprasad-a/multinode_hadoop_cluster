sudo docker rm -f hadoop-slave-2 &> /dev/null
sudo docker run -it \
                -p 50075:5002 \
                -p 8042:4002 \
		--net=hadoop-network \
		--ip 172.19.0.4 \
		--add-host hadoop-master:172.19.0.2 \
		--add-host hadoop-slave-1:172.19.0.3 \
		--hostname hadoop-slave-2 \
		--name hadoop-slave-2 \
		hadoop_slave:latest &> /dev/null
