FROM playn/alpine:latest
ARG v2ray_version=4.20.0
RUN set -ex && \
    apk --no-cache add ca-certificates && \
    mkdir /usr/bin/v2ray && \
    mkdir /var/log/v2ray && \
    wget https://github.com/v2ray/v2ray-core/releases/download/v${v2ray_version}/v2ray-linux-64.zip && \
    unzip v2ray-linux-64.zip -d /tmp && \
    mv /tmp/geoip.dat \
       /tmp/geosite.dat \
       /tmp/v2ctl \
       /tmp/v2ray \
       /usr/bin/v2ray && \
    rm -rf v2ray-linux-64.zip /tmp/* && \
    chmod +x /usr/bin/v2ray/v2ctl && \
    chmod +x /usr/bin/v2ray/v2ray
#ENV PATH /usr/bin/v2ray:$PATH