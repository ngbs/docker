FROM playn/alpine
ARG version=4.1.3
RUN wget https://github.com/go-acme/lego/releases/download/v${version}/lego_v${version}_linux_amd64.tar.gz -P /tmp && \
    tar zxf /tmp/lego_v{$version}_linux_amd64.tar.gz -C /tmp && \
    mv /tmp/lego /usr/bin/lego && \
    rm -rf /tmp/*
ENTRYPOINT ["/usr/bin/lego"]