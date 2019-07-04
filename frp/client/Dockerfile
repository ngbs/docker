FROM playn/alpine:latest
ARG frp_version=0.27.0
RUN wget https://github.com/fatedier/frp/releases/download/v${frp_version}/frp_${frp_version}_linux_amd64.tar.gz && \
    tar zxf frp_${frp_version}_linux_amd64.tar.gz -C /tmp && \
    cd /tmp/frp_${frp_version}_linux_amd64 && \
    mv frpc \
       /usr/local/bin && \
    cd / && \
    rm -rf frp_${frp_version}_linux_amd64.tar.gz /tmp/*