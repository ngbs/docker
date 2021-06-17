FROM playn/alpine:edge AS builder
RUN apk add --no-cache cargo make && \
    cargo install doh-proxy

FROM playn/alpine:edge
COPY --from=builder /root/.cargo/bin/doh-proxy /usr/local/bin/doh-proxy
RUN apk add --no-cache libgcc
RUN doh-proxy --hostname dns.ngbs.fun \
              --listen-address 0.0.0.0:3000 \
              --local-bind-address 0.0.0.0 \
              --public-address <public_address> \
              --server-address 9.9.9.9:53 \
              --tls-cert-key-path <tls_cert_key_path> \
              --tls-cert-path <tls_cert_path>