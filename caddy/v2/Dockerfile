# syntax=docker/dockerfile:1
FROM golang:1.17-alpine AS builder
RUN go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest && \
    xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    # --with github.com/caddy-dns/dnspod \
    # --with github.com/caddy-dns/duckdns \
    # --with github.com/caddy-dns/route53 \
    --with github.com/mholt/caddy-webdav \
    --with github.com/mholt/caddy-l4 \
    --with github.com/mholt/caddy-dynamicdns \
    # --with github.com/abiosoft/caddy-exec \
    # --with github.com/greenpau/caddy-trace \
    # --with github.com/greenpau/caddy-auth-jwt \
    # --with github.com/greenpau/caddy-auth-portal \
    # --with github.com/porech/caddy-maxmind-geolocation \
    --with github.com/imgk/caddy-trojan \
    --with github.com/kirsch33/realip \
    --with github.com/mastercactapus/caddy2-proxyprotocol \
    --with github.com/caddyserver/forwardproxy@caddy2=github.com/klzgrad/forwardproxy@naive

    # export CADDY_VERSION=$(wget -qO- https://api.github.com/repos/caddyserver/caddy/releases/latest | grep '"tag_name":' | head -n 1 | sed -E 's/.*"([^"]+)".*/\1/') && \
    # xcaddy build ${CADDY_VERSION} \

FROM playn/alpine
COPY --from=builder /go/caddy /usr/local/bin/
ENV XDG_CONFIG_HOME=/config
ENV XDG_DATA_HOME=/data
VOLUME /config
VOLUME /data
# EXPOSE 80
# EXPOSE 443
# EXPOSE 2019
ENTRYPOINT ["/usr/local/bin/caddy"]