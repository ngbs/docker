FROM playn/alpine:edge
ARG VERSION=v89.0.4389.72-1
RUN apk add --no-cach nss && \
    wget https://github.com/klzgrad/naiveproxy/releases/download/${VERSION}/naiveproxy-${VERSION}-linux-x64.tar.xz && \
    tar xJvf naiveproxy-${VERSION}-linux-x64.tar.xz && \
    mv naiveproxy-${VERSION}-linux-x64/naive /usr/bin && \
    rm -rf naiveproxy-*
ENTRYPOINT ["/usr/bin/naive"]
CMD ["/etc/naive/config.json"]