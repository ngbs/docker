FROM playn/alpine:latest
ARG version=1.0.1
RUN wget https://github.com/mholt/caddy/releases/download/v${version}/caddy_v${version}_linux_amd64.tar.gz && \
    tar -zxvf caddy_v${version}_linux_amd64.tar.gz -C /tmp && \
    mv /tmp/caddy /usr/bin && \
    rm -rf /tmp/* && \
    chmod +x /usr/bin/caddy