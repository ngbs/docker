FROM php:8.1-rc-fpm-alpine
RUN wget --quiet -O /tmp/ioncube.tar.gz "https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz" && \
    tar -xvvzf /tmp/ioncube.tar.gz && \
    ls -la /tmp && ls -la /usr/local/lib/php/extensions/*
    # mv /tmp/ioncube/ioncube_loader_lin_8.1.so /usr/local/lib/php/extensions/* && \
    # rm -rf /tmp/* && \
    # echo "zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20200930/ioncube_loader_lin_8.1.so" > /usr/local/etc/php/conf.d/00_docker-php-ext-ioncube_loader_lin_8.1.ini && \
    # docker-php-source extract && \
    # docker-php-ext-install gd