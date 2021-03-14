FROM centos:7
RUN mkdir -p /home/server/httpd-repo
RUN chmod 777 /home/server/httpd-repo
RUN yum -y install createrepo
RUN yum install --downloadonly --downloaddir=/home/server/httpd-repo/ httpd
COPY custom.repo /etc/yum.repos.d/
RUN createrepo -p /home/server/httpd-repo
RUN yum-config-manager --enable "customrepo"
RUN yum -y install httpd
COPY httpd.conf /etc/httpd/conf/
COPY index.html /home/server
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
EXPOSE 8899


