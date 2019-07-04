ARG alpine_version=latest
ARG frp_version=0.27.0
FROM playn/alpine:${alpine_version}
RUN wget https://github.com/fatedier/frp/releases/download/v${frp_version}/frp_${frp_version}_linux_amd64.tar.gz && \
    tar zxf frp_${frp_version}_linux_amd64.tar.gz -C /tmp && \
    cd /tmp/frp_${frp_version}_linux_amd64 && \
    mv frps \
       /usr/local/bin && \
    cd / && \
    rm -rf frp_${frp_version}_linux_amd64.tar.gz /tmp/*