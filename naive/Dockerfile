FROM playn/alpine
# ARG version=v91.0.4472.77-1
RUN apk add --no-cach gcc libstdc++ && \
    export version=$(wget -qO- https://api.github.com/repos/klzgrad/naiveproxy/releases/latest | grep '"tag_name":' | head -n 1 | sed -E 's/.*"([^"]+)".*/\1/') && \
    wget -c https://github.com/klzgrad/naiveproxy/releases/download/${version}/naiveproxy-${version}-openwrt-x86_64.tar.xz && \
    tar xJvf naiveproxy-${version}-openwrt-x86_64.tar.xz && \
    mv naiveproxy-${version}-openwrt-x86_64/naive /usr/local/bin && \
    rm -rf naiveproxy-* && \
    apk del --purge gcc && \
    unset version
ENTRYPOINT ["/usr/local/bin/naive"]
CMD ["/etc/naive/config.json"]