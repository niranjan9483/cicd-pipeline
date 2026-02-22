FROM quay.io/centos/centos:stream8
LABEL maintainer="niranjanhb1999@gmail.com"
RUN yum install -y httpd zip unzip wget && yum clean all
WORKDIR /var/www/html
RUN wget -O photogenic.zip https://templatemo.com/download/tm-554-photogenic \
    && unzip photogenic.zip -d photogenic \
    && cp -rvf photogenic/* . \
    && rm -rf photogenic photogenic.zip
EXPOSE 80 22
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]