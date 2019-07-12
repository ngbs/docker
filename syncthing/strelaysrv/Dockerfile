FROM playn/alpine:latest
ARG version=1.0.1
RUN wget https://github.com/syncthing/relaysrv/releases/download/v${version}/strelaysrv-linux-amd64-v${version}.tar.gz && \
    tar -zxvf strelaysrv-linux-amd64-v${version}.tar.gz -C /tmp && \
    mv /tmp/strelaysrv-linux-amd64-v${version}/strelaysrv /usr/bin && \
    rm -rf /tmp/* && \
    chmod +x /usr/bin/strelaysrv