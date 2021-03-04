FROM centos:7
#RUN yum -y install createrepo
#RUN yum -y install wget
RUN mkdir -p /home/httpd-repo
RUN chmod 777 /home/httpd-repo 
RUN yum -y install createrepo

#RUN yum -y install httpd
Copy httpd-repo /home/httpd-repo
#RUN yum install --downloadonly --downloaddir=/home/httpd-repo/ httpd
RUN ls /home/httpd-repo/
COPY custom.repo /etc/yum.repos.d/
RUN createrepo -p /home/httpd-repo
#RUN yum repolist 
RUN ls -l /home/httpd-repo

RUN yum --disablerepo=* --enablerepo="customrepo" install -y  httpd
#RUN cat /etc/httpd/conf/httpd.conf
RUN ls /etc/httpd/conf/
COPY httpd.conf /etc/httpd/conf/
copy index.html /var/www/html
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
EXPOSE 8899


