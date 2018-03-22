#!/usr/bin/env bash
sudo docker build -t hadoop_master .
sudo docker tag hadoop_master srinivasaprasada/hadoop_master