FROM php:7.4-fpm-alpine
RUN wget --quiet -O /tmp/ioncube.tar.gz "https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz" && \
    tar zxf /tmp/ioncube.tar.gz -C /tmp && \
    chown root:root /tmp/ioncube/ioncube_loader_lin_7.4.so && \
    chmod 755 /tmp/ioncube/ioncube_loader_lin_7.4.so && \
    export PHP_EXT_DIR=$(php-config --extension-dir) && \
    mv /tmp/ioncube/ioncube_loader_lin_7.4.so ${PHP_EXT_DIR}/ && \
    rm -rf /tmp/* && \
    echo "zend_extension = ${PHP_EXT_DIR}/ioncube_loader_lin_7.4.so" > /usr/local/etc/php/conf.d/00_ioncube_loader_lin_7.4.ini
RUN apk add --no-cache \
        freetype \
        libjpeg-turbo \
        libpng \
        freetype-dev \
        libjpeg-turbo-dev \
        libpng-dev && \
    docker-php-ext-configure gd \
    --with-freetype=/usr/include/ \
    --with-jpeg=/usr/include/ && \
    docker-php-ext-install -j$(nproc) gd && \
    docker-php-ext-install pdo_mysql && \
    apk del --no-cache \
        freetype-dev \
        libjpeg-turbo-dev \
        libpng-dev && \
    rm -rf /tmp/*