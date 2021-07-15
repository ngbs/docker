# syntax=docker/dockerfile:1
FROM golang:alpine AS builder
WORKDIR /go
RUN apk --no-cache --no-progress add git gcc make libc-dev linux-headers && \
    git clone --depth 1 https://github.com/zfl9/chinadns-ng.git && \
    cd /go/chinadns-ng && \
    make -j$(nproc) CFLAGS="-O3 -pipe" && \
    make install

FROM playn/alpine
COPY --from=builder --chown=0:0 /usr/local/bin/chinadns-ng /usr/local/bin/chinadns-ng
RUN apk --no-cache --no-progress add ipset
ENTRYPOINT [ "/usr/local/bin/chinadns-ng" ]