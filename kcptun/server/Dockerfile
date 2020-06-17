FROM playn/alpine:latest
ARG kcptun_version=20200409
RUN wget https://github.com/xtaci/kcptun/releases/download/v${kcptun_version}/kcptun-linux-amd64-${kcptun_version}.tar.gz && \
    tar zxf kcptun-linux-amd64-${kcptun_version}.tar.gz -C /tmp && \
    mv /tmp/server_linux_amd64 \
       /usr/local/bin/kcptun_server && \
    cd / && \
    rm -rf kcptun-linux-amd64-${kcptun_version}.tar.gz /tmp/*