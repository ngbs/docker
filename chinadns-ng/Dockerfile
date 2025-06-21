# syntax=docker/dockerfile:1
FROM playn/alpine AS builder
RUN export version=$(wget -qO- https://api.github.com/repos/zfl9/chinadns-ng/releases/latest | grep '"tag_name":' | head -n 1 | sed -E 's/.*"([^"]+)".*/\1/'); \
    wget --quiet -O /tmp/chinadns-ng https://github.com/zfl9/chinadns-ng/releases/download/${version}/chinadns-ng+wolfssl@x86_64-linux-musl@x86_64_v2@fast+lto

FROM playn/alpine:latest
COPY --from=builder /tmp/chinadns-ng /usr/local/bin/
RUN apk --no-cache --no-progress add ipset nftables
RUN chinadns-ng --version
ENTRYPOINT ["/usr/local/bin/chinadns-ng"]