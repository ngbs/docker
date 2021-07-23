# syntax=docker/dockerfile:1
FROM playn/alpine AS builder
# ARG version=2.0.46-beta3
RUN export version=$(wget -qO- https://api.github.com/repos/dnscrypt/dnscrypt-proxy/releases/latest | grep '"tag_name":' | head -n 1 | sed -E 's/.*"([^"]+)".*/\1/'); \
    wget --quiet -O /tmp/dnscrypt-proxy.tar.gz https://github.com/dnscrypt/dnscrypt-proxy/releases/download/${version}/dnscrypt-proxy-linux_x86_64-${version}.tar.gz; \
    tar -zxf /tmp/dnscrypt-proxy.tar.gz -C /tmp; \
    cd /tmp/linux-x86_64; \
    ls | awk -F "example-" '{print "mv "$0" "$1$2""}' | sh; \
    cd -; \
    mv /tmp/linux-x86_64 /usr/local/bin/dnscrypt-proxy

FROM playn/alpine
COPY --from=builder --chown=0:0 /usr/local/bin/dnscrypt-proxy /usr/local/bin/dnscrypt-proxy
ENTRYPOINT [ "/usr/local/bin/dnscrypt-proxy/dnscrypt-proxy" ]
ENV PATH /usr/local/bin/dnscrypt-proxy:$PATH