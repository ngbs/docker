# syntax=docker/dockerfile:1

# ADD file:5d673d25da3a14ce1f6cf66e4c7fd4f4b85a3759a9d93efb3fd9ff852b5b56e4 in /
# CMD ["/bin/sh"]
# RUN /bin/sh -c apk update # buildkit
# RUN /bin/sh -c apk add --no-cache bash php7 curl supervisor redis     php7-zlib php7-xml php7-phar php7-intl php7-dom php7-xmlreader php7-ctype php7-session     php7-mbstring php7-tokenizer php7-gd php7-redis php7-bcmath     php7-iconv php7-pdo php7-posix php7-gettext php7-simplexml php7-sodium php7-sysvsem     php7-fpm php7-mysqli php7-json php7-openssl php7-curl php7-sockets php7-zip php7-pdo_mysql     php7-xmlwriter php7-opcache php7-gmp php7-pdo_sqlite php7-sqlite3 php7-pcntl php7-fileinfo     git mailcap # buildkit
# RUN /bin/sh -c mkdir /www # buildkit
# RUN /bin/sh -c mkdir /wwwlogs # buildkit
# RUN /bin/sh -c mkdir /rdb # buildkit
# RUN /bin/sh -c mkdir -p /run/php # buildkit
# RUN /bin/sh -c mkdir -p /run/caddy # buildkit
# RUN /bin/sh -c mkdir -p /run/supervisor # buildkit
# COPY config/php-fpm.conf /etc/php7/php-fpm.d/www.conf # buildkit
# COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf # buildkit
# COPY bin/caddy /usr/local/bin/caddy # buildkit
# WORKDIR /www
# EXPOSE map[443/tcp:{} 80/tcp:{}]
# CMD ["/usr/bin/supervisord" "-c" "/etc/supervisor/conf.d/supervisord.conf"]
FROM alpine

RUN apk update && \
    apk add --no-cache \
    bash \
    php7 \
    curl \
    supervisor \
    redis \
    php7-zlib \
    php7-xml \
    php7-phar \
    php7-intl \
    php7-dom \
    php7-xmlreader \
    php7-ctype \
    php7-session \
    php7-mbstring \
    php7-tokenizer \
    php7-gd php7-redis \
    php7-bcmath \
    php7-iconv \
    php7-pdo \
    php7-posix \
    php7-gettext \
    php7-simplexml \
    php7-sodium \
    php7-sysvsem \
    php7-fpm \
    php7-mysqli \
    php7-json \
    php7-openssl \
    php7-curl \
    php7-sockets \
    php7-zip \
    php7-pdo_mysql \
    php7-xmlwriter \
    php7-opcache \
    php7-gmp \
    php7-pdo_sqlite \
    php7-sqlite3 \
    php7-pcntl \
    php7-fileinfo \
    git \
    mailcap && \
    mkdir /www && \
    mkdir /wwwlogs && \
    mkdir /rdb && \
    mkdir -p /run/php && \
    mkdir -p /run/caddy && \
    mkdir -p /run/supervisor

COPY config/php-fpm.conf /etc/php7/php-fpm.d/www.conf
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY bin/caddy /usr/local/bin/caddy

WORKDIR /www

EXPOSE map[443/tcp:{} 80/tcp:{}]

CMD ["/usr/bin/supervisord" "-c" "/etc/supervisor/conf.d/supervisord.conf"]