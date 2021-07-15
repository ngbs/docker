FROM playn/alpine
# ARG version=4.4.0
RUN export version=$(wget -qO- https://api.github.com/repos/go-acme/lego/releases/latest | grep '"tag_name":' | head -n 1 | sed -E 's/.*"([^"]+)".*/\1/') && \
    wget -c https://github.com/go-acme/lego/releases/download/v${version}/lego_v${version}_linux_amd64.tar.gz -P /tmp && \
    tar zxf /tmp/lego_v${version}_linux_amd64.tar.gz -C /tmp && \
    mv /tmp/lego /usr/local/bin/lego && \
    rm -rf /tmp/* && \
    unset version
ENTRYPOINT ["/usr/local/bin/lego"]