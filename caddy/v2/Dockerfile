FROM golang:alpine AS builder

RUN apk add --no-cach git && \
    go get -u github.com/caddyserver/xcaddy/cmd/xcaddy && \
    xcaddy build master \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mastercactapus/caddy2-proxyprotocol \
    --with github.com/caddyserver/forwardproxy@caddy2=github.com/klzgrad/forwardproxy@naive \
    --with github.com/mholt/caddy-l4

FROM playn/alpine
COPY --from=builder /go/caddy /usr/bin/

ENV XDG_CONFIG_HOME=/config
ENV XDG_DATA_HOME=/data

VOLUME /config
VOLUME /data

#EXPOSE 80
#EXPOSE 443
#EXPOSE 2019

#ENTRYPOINT ["/usr/bin/caddy"]