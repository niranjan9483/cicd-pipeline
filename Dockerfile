FROM ubuntu:22.04
LABEL maintainer="niranjanhb1999@gmail.com"

# Added -U "Mozilla/5.0" to bypass the 403 Forbidden error from TemplateMo
RUN apt-get update && apt-get install -y apache2 zip unzip wget && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

RUN wget -U "Mozilla/5.0" -O photogenic.zip https://templatemo.com \
    && unzip photogenic.zip -d photogenic \
    && cp -rvf photogenic/* . \
    && rm -rf photogenic photogenic.zip

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]
