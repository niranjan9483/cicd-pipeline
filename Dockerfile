FROM ubuntu:22.04
LABEL maintainer="niranjanhb1999@gmail.com"

# Install dependencies and clean up apt cache to keep image small
RUN apt-get update && apt-get install -y apache2 zip unzip wget && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

# 1. Use the full download path: /download/tm-554-photogenic
# 2. Use -U "Mozilla/5.0" to bypass the server's anti-bot 403 error
RUN wget -U "Mozilla/5.0" -O photogenic.zip https://templatemo.com/download/tm-554-photogenic \
    && unzip photogenic.zip \
    && cp -rvf tm-554-photogenic/* . \
    && rm -rf tm-554-photogenic photogenic.zip

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]
