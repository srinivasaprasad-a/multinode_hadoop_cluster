#!/usr/bin/env bash
sudo docker build -t hadoop_slave .
sudo docker tag hadoop_slave srinivasaprasada/hadoop_slave