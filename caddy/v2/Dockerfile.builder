FROM  golang:1.14-alpine AS builder
ARG version=2.1.1
RUN apk add --no-cach git && \
    go get -u github.com/caddyserver/xcaddy/cmd/xcaddy && \
   #git clone -b naive https://github.com/klzgrad/forwardproxy && \
   #xcaddy build --with github.com/caddyserver/forwardproxy=$PWD/forwardproxy
    xcaddy build v${version} --with github.com/caddyserver/forwardproxy@1.0.1

FROM playn/alpine:3.12.0
COPY --from=builder /go/caddy /usr/bin/

ENTRYPOINT ["/usr/bin/caddy"]
#CMD ["-config", "/etc/caddy/Caddyfile"]
