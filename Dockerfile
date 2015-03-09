#run the following command on host machine before building docker image
#mkdir -p _ssh && ssh-keygen -t rsa -N "" -f _ssh/id_rsa && cp _ssh/id_rsa.pub _ssh/authorized_keys

FROM ubuntu:12.04

ENV DEBIAN_FRONTEND noninteractive
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list
RUN apt-get update && apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository ppa:webupd8team/java -y
RUN apt-get update
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java7-installer

RUN apt-get install wget axel -y
RUN axel -a http://d3kbcqa49mib13.cloudfront.net/spark-1.2.1-bin-hadoop2.4.tgz
RUN tar -zxvf spark-1.2.1-bin-hadoop2.4.tgz

RUN apt-get install net-tools iputils-ping telnet vim ssh ipython htop -y

ADD _ssh /root/.ssh

ADD run.sh /run.sh
RUN chmod +x /run.sh
CMD /run.sh
