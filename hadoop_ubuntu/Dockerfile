FROM ubuntu:16.04
MAINTAINER SrinivasaPrasadA

USER root

RUN apt-get update && \
    apt-get install -y openjdk-8-jdk openssh-server curl

# Setup passwordless ssh
RUN rm -f /etc/ssh/ssh_host_dsa_key /etc/ssh/ssh_host_rsa_key /root/.ssh/id_rsa && \
    ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key && \
    ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key && \
    ssh-keygen -q -N "" -t rsa -f /root/.ssh/id_rsa && \
    cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys

WORKDIR /programs/
RUN pwd

ENV HADOOP_VERSION 2.9.0

RUN curl -fSL https://www.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz -o /programs/hadoop-$HADOOP_VERSION.tar.gz && \
    gunzip /programs/hadoop-$HADOOP_VERSION.tar.gz && \
    tar xf /programs/hadoop-$HADOOP_VERSION.tar && \
    mv /programs/hadoop-$HADOOP_VERSION /programs/hadoop && \
    rm /programs/hadoop-$HADOOP_VERSION.tar

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV PATH $PATH:$JAVA_HOME
ENV HADOOP_PREFIX /programs/hadoop
ENV PATH $PATH:$HADOOP_PREFIX/bin

RUN mkdir $HADOOP_PREFIX/logs && \
    chown root:root $HADOOP_PREFIX/logs

# Update HADOOP config files
ADD core-site.xml $HADOOP_PREFIX/etc/hadoop/core-site.xml
ADD hdfs-site.xml $HADOOP_PREFIX/etc/hadoop/hdfs-site.xml
ADD mapred-site.xml $HADOOP_PREFIX/etc/hadoop/mapred-site.xml
ADD yarn-site.xml $HADOOP_PREFIX/etc/hadoop/yarn-site.xml
ADD slaves $HADOOP_PREFIX/etc/hadoop/slaves
ADD hadoop-env.sh $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh

ADD ssh_config /etc/ssh/ssh_config
ADD sshd_config /etc/ssh/sshd_config
ADD ssh_config /root/.ssh/config
RUN chmod 600 /root/.ssh/config && \
    chown root:root /root/.ssh/config

RUN chmod +x $HADOOP_PREFIX/etc/hadoop/*-env.sh

# Hdfs ports
EXPOSE 50010 50020 50070 50075 50090 50100 8020 9000 9001
# Mapred ports
EXPOSE 10020 19888
#Yarn ports
EXPOSE 8030 8031 8032 8033 8040 8042 8088
#Other ports
EXPOSE 49707 2122 2222 4040

