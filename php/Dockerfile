FROM php:8.1-rc-fpm-alpine
RUN wget --quiet -O /tmp/ioncube.tar.gz "https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz" && \
    tar -xvvzf /tmp/ioncube.tar.gz && \
    mv /tmp/ioncube/ioncube_loader_lin_8.1.so `php-config --extension-dir` && \
    rm -rf /tmp/* && \
    docker-php-ext-enable ioncube_loader_lin_8.1 && \
    docker-php-source extract && \
    docker-php-ext-install gd