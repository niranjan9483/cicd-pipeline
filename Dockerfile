FROM centos:latest
MAINTAINER niranjanhb1999@gmail.com

# Install Apache, unzip, wget
RUN yum install -y httpd zip unzip wget && yum clean all

# Download template into /var/www/html
WORKDIR /var/www/html
RUN wget -O photogenic.zip https://templatemo.com/download/tm-554-photogenic \
    && unzip photogenic.zip -d photogenic \
    && cp -rvf photogenic/* . \
    && rm -rf photogenic photogenic.zip

# Expose port 80 and run Apache
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]