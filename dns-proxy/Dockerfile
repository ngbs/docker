FROM playn/alpine:edge

RUN apk --update add --no-cache \
        libsodium \
        dnscrypt-proxy \
        pdnsd \
        dnsmasq && \
    rm -rf /var/cache/apk/*