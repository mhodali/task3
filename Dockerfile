FROM centos:7 
RUN yum -y install createrepo
RUN yum -y install wget
RUN mkdir -p /home/httpd-repo
RUN chmod 777 /home/httpd-repo 



RUN yum install --downloadonly --downloaddir=/home/httpd-repo/ httpd
RUN cp -r /home/httpd.conf //etc/httpd/conf/httpd.conf
RUN ls /var/www/
COPY /home.task3/server/custom.repo /etc/yum.repos.d/
RUN createrepo -p /home/httpd-repo
RUN yum repolist 
RUN ls /home/httpd-repo
RUN yum --disablerepo=* --enablerepo="customrepo" install -y  httpd
COPY /home.task3/server/httpd.conf /etc/httpd/conf/httpd.conf
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
EXPOSE 8899

