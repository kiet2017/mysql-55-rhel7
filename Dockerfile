FROM hanruijie/mysql-55-rhel7:5.5

LABEL maintainer="<rjhan@alauda.io>"

USER root

RUN rpm -qa | grep yum | xargs rpm -e --nodeps \
&&  wget http://vault.centos.org/7.3.1611/os/x86_64/Packages/yum-3.4.3-150.el7.centos.noarch.rpm \
&&  wget http://vault.centos.org/7.3.1611/os/x86_64/Packages/yum-metadata-parser-1.1.4-10.el7.x86_64.rpm \
&&  wget http://vault.centos.org/7.3.1611/os/x86_64/Packages/yum-plugin-fastestmirror-1.1.31-40.el7.noarch.rpm \
&&  rpm -ivh yum-* \
&&  wget -P /etc/yum.repos.d/ http://mirrors.163.com/.help/CentOS7-Base-163.repo \
&&  sed -i "s/\$releasever/7/g" CentOS6-Base-163.repo \
&&  sed -i "s/mirrors.163.com/vault.centos.org/g" CentOS6-Base-163.repo \
&&  yum clean all \
&&  yum makecache

RUN yum -y update && yum clean all && rm -rf /tmp/*

USER mysql
