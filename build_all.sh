sudo docker build -t hadoop_ubuntu hadoop_ubuntu
sudo docker tag hadoop_ubuntu:latest hadoop_ubuntu:2.9

sudo docker build -t hadoop_master hadoop_master
sudo docker tag hadoop_master:latest hadoop_master:2.9

sudo docker build -t hadoop_slave hadoop_slave
sudo docker tag hadoop_slave:latest hadoop_slave:2.9

