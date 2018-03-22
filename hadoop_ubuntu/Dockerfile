FROM ubuntu:16.04
MAINTAINER SrinivasaPrasadA

USER root

RUN apt-get update && \
    apt-get install -y openjdk-8-jdk openssh-server openssh-client curl

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

ENV SCALA_VERSION 2.11.11

RUN curl -fSL http://downloads.lightbend.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.tgz -o /programs/scala-$SCALA_VERSION.tgz && \
    gunzip /programs/scala-$SCALA_VERSION.tgz && \
    tar xf /programs/scala-$SCALA_VERSION.tar && \
    mv /programs/scala-$SCALA_VERSION /programs/scala && \
    rm /programs/scala-$SCALA_VERSION.tar

ENV SPARK_VERSION 2.2.0

#Download Spark for Hadoop version 2.7 or later
RUN curl -fSL http://redrockdigimark.com/apachemirror/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop2.7.tgz -o /programs/spark-$SPARK_VERSION.tgz && \
    gunzip /programs/spark-$SPARK_VERSION.tgz && \
    tar xf /programs/spark-$SPARK_VERSION.tar && \
    mv /programs/spark-$SPARK_VERSION-bin-hadoop2.7 /programs/spark && \
    rm /programs/spark-$SPARK_VERSION.tar

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV PATH $PATH:$JAVA_HOME
ENV HADOOP_PREFIX /programs/hadoop
ENV HADOOP_HOME /programs/hadoop
ENV PATH $PATH:$HADOOP_PREFIX/bin
ENV SPARK_HOME /programs/spark
ENV PATH $PATH:$SPARK_HOME
ENV SCALA_HOME /programs/scala
ENV PATH $PATH:$SCALA_HOME/bin

ENV HADOOP_CONF_DIR=$HADOOP_PREFIX/etc/hadoop
ENV YARN_CONF_DIR=$HADOOP_PREFIX/etc/hadoop

RUN mkdir $HADOOP_PREFIX/logs && \
    chown root:root $HADOOP_PREFIX/logs

# Update HADOOP config files
ADD core-site.xml $HADOOP_PREFIX/etc/hadoop/core-site.xml
ADD hdfs-site.xml $HADOOP_PREFIX/etc/hadoop/hdfs-site.xml
ADD mapred-site.xml $HADOOP_PREFIX/etc/hadoop/mapred-site.xml
ADD yarn-site.xml $HADOOP_PREFIX/etc/hadoop/yarn-site.xml
ADD slaves $HADOOP_PREFIX/etc/hadoop/slaves
ADD hadoop-env.sh $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh
ADD spark-env.sh $SPARK_HOME/conf/spark-env.sh
ADD slaves $SPARK_HOME/conf/slaves

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

