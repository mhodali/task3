FROM centos:7
RUN yum -y install createrepo
RUN yum -y install wget
RUN mkdir -p /home/httpd-repo
COPY custom.repo /etc/yum.repos.d/

RUN wget -r -np -nH   10.0.2.15:8899/repo/ -P /home/httpd-repo
COPY validate.sh /home
RUN chmod 777 /home/validate.sh
RUN /home/validate.sh
RUN createrepo -p /home/httpd-repo
RUN yum repolist
RUN yum --disablerepo=* --enablerepo="customrepo" install -y  httpd
COPY index.html /var/www/html

CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
EXPOSE 80

