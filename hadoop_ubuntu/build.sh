#!/usr/bin/env bash
sudo docker build -t hadoop_ubuntu .
sudo docker tag hadoop_ubuntu srinivasaprasada/hadoop_ubuntu