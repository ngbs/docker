FROM playn/alpine:edge

RUN set -xe && \
    apk --update add --no-cache --virtual .run-deps \
        libevent \
        libsodium && \
    apk --update add --no-cache --virtual .build-deps \
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
    apk del .build-deps && \
    mkdir -p /var/lib/dnscrypt-wrapper/dnskey && \
    rm -rf /var/cache/apk/* /dnscrypt-wrapper