FROM ubuntu:22.04
LABEL maintainer="niranjanhb1999@gmail.com"

# Install dependencies and clean up apt cache
RUN apt-get update && apt-get install -y apache2 zip unzip wget \
    && rm -rf /var/lib/apt/lists/* \
    && echo "Hello World" > /var/www/html/index.html

WORKDIR /var/www/html

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=5s \
  CMD curl -f http://localhost/ || exit 1

CMD ["apache2ctl", "-D", "FOREGROUND"]