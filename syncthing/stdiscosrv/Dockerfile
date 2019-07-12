FROM playn/alpine:latest
ARG version=1.0.1
RUN wget https://github.com/syncthing/discosrv/releases/download/v${version}/stdiscosrv-linux-amd64-v${version}.tar.gz && \
    tar -zxvf stdiscosrv-linux-amd64-v${version}.tar.gz -C /tmp && \
    mv /tmp/stdiscosrv /usr/bin && \
    rm -rf /tmp/* && \
    chmod +x /usr/bin/stdiscosrv