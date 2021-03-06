# syntax=docker/dockerfile:1
FROM golang:alpine AS builder
RUN apk add --no-cach git && \
    go get -u github.com/caddyserver/xcaddy/cmd/xcaddy && \
    git clone --depth 1 -b naive https://github.com/klzgrad/forwardproxy && \
    export version=$(wget -qO- https://api.github.com/repos/caddyserver/caddy/releases/latest | grep '"tag_name":' | head -n 1 | sed -E 's/.*"([^"]+)".*/\1/') && \
    # xcaddy build ${version} --output ./caddy_${version} \
    xcaddy build ${version} \
        --with github.com/abiosoft/caddy-exec \
        --with github.com/caddy-dns/cloudflare \
        # --with github.com/caddy-dns/dnspod \
        # --with github.com/caddy-dns/duckdns \
        # --with github.com/caddy-dns/gandi \
        # --with github.com/caddy-dns/route53 \
        # --with github.com/greenpau/caddy-auth-jwt \
        # --with github.com/greenpau/caddy-auth-portal \
        # --with github.com/greenpau/caddy-trace \
        # --with github.com/hairyhenderson/caddy-teapot-module \
        # --with github.com/kirsch33/realip \
        # --with github.com/porech/caddy-maxmind-geolocation \
        # --with github.com/caddyserver/format-encoder \
        --with github.com/mastercactapus/caddy2-proxyprotocol \
        # --with github.com/caddyserver/forwardproxy@caddy2=github.com/klzgrad/forwardproxy@naive \
        --with github.com/caddyserver/forwardproxy=$PWD/forwardproxy \
        --with github.com/mholt/caddy-l4 \
        --with github.com/mholt/caddy-webdav

FROM playn/alpine
COPY --from=builder /go/caddy /usr/bin/
ENV XDG_CONFIG_HOME=/config
ENV XDG_DATA_HOME=/data
VOLUME /config
VOLUME /data
# EXPOSE 80
# EXPOSE 443
# EXPOSE 2019
ENTRYPOINT ["/usr/bin/caddy"]