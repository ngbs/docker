# syntax=docker/dockerfile:1
FROM golang:alpine AS builder
RUN apk --no-cache add git
WORKDIR /go/src
RUN git clone --depth 1 https://github.com/xtls/xray-core.git . && \
    CGO_ENABLED=0 go build -o xray -trimpath -ldflags "-s -w -buildid=" ./main

FROM playn/alpine
ADD https://raw.githubusercontent.com/ngbs/rules-dat/release/geoip.dat /usr/local/bin/xray/
ADD https://raw.githubusercontent.com/ngbs/rules-dat/release/geosite.dat /usr/local/bin/xray/
COPY --from=builder /go/src/xray /usr/local/bin/xray/
RUN apk --no-cache add ca-certificates

ENTRYPOINT ["/usr/local/bin/xray/xray"]
ENV PATH /usr/local/bin/xray:$PATH