
FROM centos:7
RUN yum -y install httpd
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
EXPOSE 8899
