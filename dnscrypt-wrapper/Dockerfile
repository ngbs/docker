FROM playn/alpine:latest
RUN set -xe && \
    apk add --no-cache --virtual .run-deps \
        libevent \
        libsodium && \
    apk add --no-cache --virtual .build-deps \
        git \
        autoconf \
        bsd-compat-headers \
        build-base \
        libevent-dev \
        libexecinfo-dev \
        libsodium-dev && \
    git clone --recursive git://github.com/cofyc/dnscrypt-wrapper.git && \
    cd dnscrypt-wrapper && \
    make configure && \
    ./configure && \
    make install && \
    cd .. && \
    rm -rf dnscrypt-wrapper && \
    apk del .build-deps && \
    mkdir -p /opt/dnscrypt\-wrapper/keys