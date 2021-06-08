FROM playn/alpine:edge
ARG VERSION=v91.0.4472.77-1
RUN apk add --no-cach gcc && \
    wget https://github.com/klzgrad/naiveproxy/releases/download/${VERSION}/naiveproxy-${VERSION}-openwrt-x86_64.tar.xz && \
    tar xJvf naiveproxy-${VERSION}-openwrt-x86_64.tar.xz && \
    mv naiveproxy-${VERSION}-openwrt-x86_64/naive /usr/bin && \
    rm -rf naiveproxy-*
ENTRYPOINT ["/usr/bin/naive"]
CMD ["/etc/naive/config.json"]