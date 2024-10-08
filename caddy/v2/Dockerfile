# syntax=docker/dockerfile:1
FROM golang:alpine AS builder
RUN go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest && \
    export CADDY_VERSION=$(wget -qO- https://api.github.com/repos/caddyserver/caddy/releases/latest | grep '"tag_name":' | head -n 1 | sed -E 's/.*"([^"]+)".*/\1/') && \
    xcaddy build ${CADDY_VERSION} \
        # --with github.com/mastercactapus/caddy2-proxyprotocol \
        --with github.com/caddy-dns/cloudflare \
        --with github.com/mholt/caddy-dynamicdns \
        --with github.com/mholt/caddy-webdav

FROM playn/alpine
COPY --from=builder /go/caddy /usr/local/bin/

ENV XDG_CONFIG_HOME=/config
ENV XDG_DATA_HOME=/data

WORKDIR /srv

CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]