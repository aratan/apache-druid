FROM ubuntu:20.04

RUN apt update -y && apt install openjdk-8-jdk -y
RUN apt install python pip wget -y
RUN apt install nano -y
RUN wget https://dlcdn.apache.org/druid/27.0.0/apache-druid-27.0.0-bin.tar.gz
RUN tar -xzf apache-druid-27.0.0-bin.tar.gz
RUN cd apache-druid-27.0.0
RUN export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
RUN export DRUID_HOME=/home/ubuntu/apache-druid-27.0.0
ENV PATH=$JAVA_HOME/bin:$DRUID_HOME/bin:$PATH
ENV PATH=$PATH:$HOME/bin
CMD ["bash", "-c", "/apache-druid-27.0.0/bin/start-druid"]
