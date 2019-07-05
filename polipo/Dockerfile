FROM playn/alpine:latest
RUN apk add --no-cache --virtual .build-deps \
        build-base \
        openssl && \
    wget https://github.com/jech/polipo/archive/polipo-1.1.1.tar.gz && \
    tar xf polipo-1.1.1.tar.gz && \
    cd polipo-polipo-1.1.1 && \
    make all -i && \
    mv polipo /usr/local/bin && \
    cd .. && \
    mkdir -p /usr/share/polipo/www /var/cache/polipo && \
    apk del .build-deps && \
    rm -rf *polipo-1.1.1*