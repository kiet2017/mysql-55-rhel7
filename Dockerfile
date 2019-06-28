FROM hanruijie/mysql-55-rhel7:5.5

LABEL maintainer="<rjhan@alauda.io>"

USER root

COPY ./yum.rpm/* /
COPY ./CentOS-Base.repo  /etc/yum.repos.d/

RUN rpm -qa | grep yum | xargs rpm -e --nodeps \
&&  rpm -ivh yum-* \
&&  yum clean all \
&&  yum makecache

RUN yum -y update && yum clean all && rm -rf /tmp/*

USER mysql
