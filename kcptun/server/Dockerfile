FROM playn/alpine:edge

ARG kcptun_version=20190109
         
RUN wget https://github.com/xtaci/kcptun/releases/download/v${kcptun_version}/kcptun-linux-amd64-${kcptun_version}.tar.gz && \
    tar zxf kcptun-linux-amd64-${kcptun_version}.tar.gz -C /tmp && \
    cd /tmp/kcptun-linux-amd64-${kcptun_version}.tar && \
    mv server_linux_amd64 \
       /usr/local/bin && \
    cd / && \
    rm -rf kcptun-linux-amd64-${kcptun_version}.tar.gz /tmp/*