FROM playn/alpine:edge AS builder
RUN apk add --no-cache cargo make && \
    cargo install encrypted-dns

FROM playn/alpine:edge
COPY --from=builder /root/.cargo/bin/encrypted-dns /usr/local/bin/encrypted-dns
RUN apk add --no-cache libgcc
RUN encrypted-dns -c /etc/encrypted-dns/encrypted-dns.toml