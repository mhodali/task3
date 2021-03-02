FROM centos 
RUN yum -y install createrepo
RUN yum -y install wget
RUN mkdir -p /home/httpd-repo
RUN dnf install -y  mod_http2
RUN yum clean all

RUN wget http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/mailcap-2.1.48-3.el8.noarch.rpm -P /home/httpd-repo
RUN wget http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/httpd-filesystem-2.4.37-30.module_el8.3.0+561+97fdbbcc.noarch.rpm  -P /home/httpd-repo
RUN wget http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/apr-1.6.3-11.el8.x86_64.rpm  -P /home/httpd-repo
RUN wget http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/apr-util-1.6.1-6.el8.x86_64.rpm -P /home/httpd-repo
RUN wget http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/brotli-1.0.6-2.el8.x86_64.rpm -P /home/httpd-repo
#RUN wget https://pkgs.dyn.su/el8/modular/x86_64/mod_http2-0:1.15.7-1.el8.x86_64.rpm  -P /home/httpd-repo
RUN wget http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/centos-logos-httpd-80.5-2.el8.noarch.rpm  -P /home/httpd-repo
RUN wget http://repo.okay.com.mx/centos/8/x86_64/release/httpd-filesystem-2.4.37-12.el8.noarch.rpm -P /home/httpd-repo
RUN wget http://repo.okay.com.mx/centos/8/x86_64/release/httpd-tools-2.4.37-12.el8.x86_64.rpm -P /home/httpd-repo


RUN wget http://repo.okay.com.mx/centos/8/x86_64/release/httpd-2.4.37-12.el8.x86_64.rpm -P /home/httpd-repo
COPY index.html /var/www/html/
RUN echo [customrepo] >> /etc/yum.repos.d/custom.repo
RUN echo name=Custom Repository >> /etc/yum.repos.d/custom.repo
RUN echo baseurl=file:///home/httpd-repo >> /etc/yum.repos.d/custom.repo
RUN echo enabled=1 >> /etc/yum.repos.d/custom.repo
RUN echo gpgcheck=0 >> /etc/yum.repos.d/custom.repo
RUN createrepo -p /home/httpd-repo
RUN yum repolist 
RUN ls /home/httpd-repo
RUN yum --disablerepo=* --enablerepo="customrepo" install -y  httpd
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
EXPOSE 80

