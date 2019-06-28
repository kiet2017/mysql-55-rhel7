FROM hanruijie/mysql-55-rhel7:5.5

LABEL maintainer="<rjhan@alauda.io>"

USER root

#RUN cp /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak

#COPY ./CentOS-Base.repo /etc/yum.repos.d/

RUN yum -y update && yum clean all && rm -rf /tmp/*
