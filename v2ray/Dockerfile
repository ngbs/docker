# syntax=docker/dockerfile:1
FROM golang:alpine AS builder
RUN apk --no-cache add git bash curl
WORKDIR /go/src
RUN git clone https://github.com/v2fly/v2ray-core.git && \
    cd v2ray-core && go mod download && \
    CGO_ENABLED=0 go build -o ./v2ray -trimpath -ldflags "-s -w -buildid=" ./main && \
    # CGO_ENABLED=0 go build -o ./v2ctl -trimpath -ldflags "-s -w -buildid=" -tags confonly ./infra/control/main && \
    wget -O ./geoip.dat "https://raw.githubusercontent.com/v2fly/geoip/release/geoip.dat" && \
    wget -O ./geoip-only-cn-private.dat "https://raw.githubusercontent.com/v2fly/geoip/release/geoip-only-cn-private.dat" && \
    wget -O ./geosite.dat "https://raw.githubusercontent.com/v2fly/domain-list-community/release/dlc.dat" && \
    mkdir -p /tmp/v2ray && \
    mv v2ray v2ctl geoip.dat geoip-only-cn-private.dat geosite.dat /tmp/v2ray

FROM playn/alpine
COPY --from=builder /tmp/v2ray /usr/local/bin/v2ray
RUN apk --no-cache add ca-certificates

ENTRYPOINT ["/usr/local/bin/v2ray/v2ray"]
ENV PATH /usr/local/bin/v2ray:$PATH