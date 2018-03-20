sudo docker network rm -f hadoop-network &> /dev/null
sudo docker network create \
		--driver bridge \
		hadoop-network &> /dev/null

echo "start hadoop-master container..."
sudo docker rm -f hadoop-master &> /dev/null
sudo docker run -itd \
		-p 2222:2222 \
		-p 4040:4040 \
		-p 8020:8020 \
		-p 8088:8088 \
		-p 9001:9001 \
                -p 50070:50070 \
		-p 50090:50090 \
		--net=hadoop-network \
		--ip 172.19.0.2 \
		--add-host hadoop-slave-1:172.19.0.3 \
		--add-host hadoop-slave-2:172.19.0.4 \
                --hostname hadoop-master \
                --name hadoop-master \
		hadoop_master:2.9 &> /dev/null
echo "done."

echo "start hadoop-slave-1 container..."
sudo docker rm -f hadoop-slave-1 &> /dev/null
sudo docker run -itd \
		--net=hadoop-network \
		--ip 172.19.0.3 \
		--add-host hadoop-master:172.19.0.2 \
		--add-host hadoop-slave-2:172.19.0.4 \
		--hostname hadoop-slave-1 \
		--name hadoop-slave-1 \
		hadoop_slave:2.9 &> /dev/null
echo "done."

echo "start hadoop-slave-2 container..."
sudo docker rm -f hadoop-slave-2 &> /dev/null
sudo docker run -itd \
		--net=hadoop-network \
		--ip 172.19.0.4 \
		--add-host hadoop-master:172.19.0.2 \
		--add-host hadoop-slave-1:172.19.0.3 \
		--hostname hadoop-slave-2 \
		--name hadoop-slave-2 \
		hadoop_slave:2.9 &> /dev/null
echo "done."

