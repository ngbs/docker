FROM  golang:1.14-alpine AS builder
ARG version=2.1.1
RUN apk add --no-cach git && \
    go get -u github.com/caddyserver/xcaddy/cmd/xcaddy && \
    xcaddy build v${version} --with github.com/caddyserver/forwardproxy@1.0.1

FROM playn/alpine:3.12.0
COPY --from=builder /go/caddy /usr/bin/

#ENV XDG_CONFIG_HOME=/config
#ENV XDG_DATA_HOME=/data

#VOLUME /config
#VOLUME /data

#EXPOSE 80
#EXPOSE 443
#EXPOSE 2019

ENTRYPOINT ["/usr/bin/caddy"]
CMD ["run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
