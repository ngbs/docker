FROM playn/alpine:latest
ARG version=1.2.0
RUN wget https://github.com/syncthing/syncthing/releases/download/v${version}/syncthing-linux-amd64-v${version}.tar.gz && \
    tar -zxvf syncthing-linux-amd64-v${version}.tar.gz -C /tmp && \
    mv /tmp/syncthing-linux-amd64-v${version}/syncthing /usr/bin && \
    rm -rf /*.tar.gz /tmp/* && \
    chmod +x /usr/bin/syncthing