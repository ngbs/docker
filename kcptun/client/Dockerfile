FROM playn/alpine
ARG kcptun_version=20201126
RUN wget https://github.com/xtaci/kcptun/releases/download/v${kcptun_version}/kcptun-linux-amd64-${kcptun_version}.tar.gz && \
    tar zxf kcptun-linux-amd64-${kcptun_version}.tar.gz -C /tmp && \
    mv /tmp/client_linux_amd64 \
       /usr/bin/kcptun_client && \
    cd / && \
    rm -rf kcptun-linux-amd64-${kcptun_version}.tar.gz /tmp/*
ENTRYPOINT ["/usr/bin/kcptun_client"]
