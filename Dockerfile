FROM centos:centos7

RUN yum update -y
RUN yum install -y wget tree sudo diffutils patch

RUN mkdir /opt/nginx

RUN wget "http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm" -O "/opt/nginx/downloaded.rpm"
RUN yum localinstall -y /opt/nginx/downloaded.rpm
RUN yum install -y nginx

ADD start.sh /opt/nginx/start.sh

ADD reverseproxy.conf /etc/nginx/conf.d/reverseproxy.conf

EXPOSE 0.0.0.0:80:80
WORKDIR /opt/nginx
CMD source /opt/nginx/start.sh