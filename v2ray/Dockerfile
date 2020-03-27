FROM playn/alpine:latest
ARG v2ray_version=4.23.1
RUN set -ex && \
    apk --no-cache add ca-certificates && \
    mkdir /usr/bin/v2ray && \
    mkdir /var/log/v2ray && \
    wget https://github.com/v2ray/v2ray-core/releases/download/v${v2ray_version}/v2ray-linux-64.zip -P /tmp && \
    unzip /tmp/v2ray-linux-64.zip -d /tmp && \
    mv /tmp/geoip.dat \
       /tmp/geosite.dat \
       /tmp/v2ctl \
       /tmp/v2ray \
       /usr/bin/v2ray && \
    rm -rf /tmp/* && \
    chmod +x /usr/bin/v2ray/v2ctl && \
    chmod +x /usr/bin/v2ray/v2ray