#!/usr/bin/env bash

sudo docker build -t hadoop_ubuntu hadoop_ubuntu
sudo docker tag hadoop_ubuntu srinivasaprasada/hadoop_ubuntu

sudo docker build -t hadoop_master hadoop_master
sudo docker tag hadoop_master srinivasaprasada/hadoop_master

sudo docker build -t hadoop_slave hadoop_slave
sudo docker tag hadoop_slave srinivasaprasada/hadoop_slave
