FROM alpine:edge AS builder
RUN apk update --no-cache && \
    apk add --no-cache rust cargo make && \
    cargo install doh-proxy

FROM playn/alpine:edge
COPY --from=builder /root/.cargo/bin/doh-proxy /usr/local/bin/doh-proxy
RUN apk add --no-cache libgcc
RUN doh-proxy --listen-address 0.0.0.0:3000 \
              --server-address 9.9.9.9:53