FROM centos:7
RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
RUN yum-config-manager --add-repo http://10.0.2.15:8899/repo/
RUN yum-config-manager --enable "10.0.2.15_8899_repo_" 
RUN yum -y install httpd
COPY index.html /var/www/html
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
EXPOSE 80

