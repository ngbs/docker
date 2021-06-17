FROM playn/alpine:edge AS builder
RUN apk update --no-cache && \
    apk add --no-cache rust cargo make && \
    cargo install encrypted-dns

FROM playn/alpine:edge
COPY --from=builder /root/.cargo/bin/encrypted-dns /usr/local/bin/encrypted-dns
RUN apk add --no-cache libgcc
ENTRYPOINT [ "/usr/local/bin/encrypted-dns" ]