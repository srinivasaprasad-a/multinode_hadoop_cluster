FROM srinivasaprasada/hadoop_ubuntu:latest
MAINTAINER SrinivasaPrasadA

USER root

RUN $HADOOP_PREFIX/bin/hdfs namenode -format

ADD start_up.sh /etc/start_up.sh
RUN chown root:root /etc/start_up.sh && \
    chmod 700 /etc/start_up.sh

CMD ["/etc/start_up.sh", "-d"]
