# syntax=docker/dockerfile:1
FROM golang:alpine AS builder
RUN apk --no-cache add git
WORKDIR /go/src
RUN git clone --depth 1 https://github.com/xtls/xray-core.git . && \
    CGO_ENABLED=0 go build -o xray -trimpath -ldflags "-s -w -buildid=" ./main && \
    wget -O ./geoip.dat "https://raw.githubusercontent.com/v2fly/geoip/release/geoip.dat" && \
    wget -O ./geoip-only-cn-private.dat "https://raw.githubusercontent.com/v2fly/geoip/release/geoip-only-cn-private.dat" && \
    wget -O ./geosite.dat "https://raw.githubusercontent.com/v2fly/domain-list-community/release/dlc.dat" && \
    mkdir -p /tmp/xray && \
    mv xray geoip.dat geoip-only-cn-private.dat geosite.dat /tmp/xray

FROM playn/alpine
# ADD https://raw.githubusercontent.com/ngbs/rules-dat/release/geoip.dat /usr/local/bin/xray/
# ADD https://raw.githubusercontent.com/ngbs/rules-dat/release/geosite.dat /usr/local/bin/xray/
COPY --from=builder /tmp/xray /usr/local/bin/xray/
# RUN apk --no-cache add ca-certificates

ENTRYPOINT ["/usr/local/bin/xray/xray"]
ENV PATH /usr/local/bin/xray:$PATH