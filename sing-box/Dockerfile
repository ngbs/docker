# syntax=docker/dockerfile:1
FROM golang:1.22-alpine AS builder
WORKDIR /go/src
ARG GOPROXY=""
ENV GOPROXY ${GOPROXY}
ENV CGO_ENABLED=1
RUN set -ex && \
    apk add git build-base && \
    export COMMIT=$(git rev-parse --short HEAD) && \
    export VERSION=$(wget -qO- https://api.github.com/repos/sagernet/sing-box/tags | grep '"name":' | head -n 1 | sed -E 's/.*"([^"]+)".*/\1/') && \
    git clone --depth 1 --branch dev-next https://github.com/sagernet/sing-box.git . && \
    go build -v -trimpath -tags with_gvisor,with_quic,with_wireguard,with_ech,with_utls,with_reality_server,with_acme,with_clash_api,with_grpc \
        -o /go/bin/sing-box \
        -ldflags "-X \"github.com/sagernet/sing-box/constant.Version=${VERSION}\" -s -w -buildid=" \
        ./cmd/sing-box
FROM playn/alpine AS dist
COPY --from=builder /go/bin/sing-box /usr/local/bin/sing-box
ENTRYPOINT ["sing-box"]