# syntax=docker/dockerfile:1
# FROM golang:1.24-alpine AS builder
# WORKDIR /go/src
# ARG GOPROXY=""
# ENV GOPROXY=${GOPROXY}
# ENV CGO_ENABLED=1
# RUN set -ex && \
#     apk add git build-base linux-headers libcap-dev libbpf-dev wireguard-tools cmake libqrencode-dev && \
#     export COMMIT=$(git rev-parse --short HEAD) && \
#     export VERSION=$(wget -qO- https://api.github.com/repos/sagernet/sing-box/tags | grep '"name":' | head -n 1 | sed -E 's/.*"([^"]+)".*/\1/') && \
#     git clone --depth 1 --branch dev-next https://github.com/sagernet/sing-box.git . && \
#     go build -v -trimpath -tags \
#         "with_gvisor,with_quic,with_wireguard,with_utls,with_acme,with_clash_api,with_grpc" \
#         -o /go/bin/sing-box \
#         -ldflags "-X \"github.com/sagernet/sing-box/constant.Version=$VERSION\" -s -w -buildid=" \
#         ./cmd/sing-box
# FROM playn/alpine AS dist
# COPY --from=builder /go/bin/sing-box /usr/local/bin/sing-box
# ENTRYPOINT ["sing-box"]

FROM golang:1.24-alpine AS builder

WORKDIR /go/src
ARG GOPROXY="https://goproxy.cn,direct"
ENV GOPROXY=${GOPROXY}
ENV CGO_ENABLED=1

RUN set -ex && \
    apk add --no-cache git build-base linux-headers libcap-dev libbpf-dev wireguard-tools cmake libqrencode-dev wget ca-certificates && \
    \
    git clone --depth 1 --branch v1.14.0-alpha.22 https://github.com/sagernet/sing-box.git . && \
    \
    export COMMIT=$(git rev-parse --short HEAD || echo "unknown") && \
    export VERSION="1.14.0-alpha.22" && \
    \
    # 这里的修改是关键：
    # 1. GOGC=off 减少编译时的 GC 开销
    # 2. -p 1 强制单线程，防止多核并行导致内存爆满
    # 3. 移除了一些不常用的 tag 以减小二进制体积和依赖压力
    GOGC=off go build -v -p 1 -trimpath -tags \
        "with_quic,with_wireguard,with_utls,with_gvisor,with_clash_api,with_acme" \
        -o /go/bin/sing-box \
        -ldflags "-X \"github.com/sagernet/sing-box/constant.Version=$VERSION\" -s -w -buildid=" \
        ./cmd/sing-box

FROM alpine:latest AS dist
# 必须包含运行时依赖，否则 CGO 编译的可执行文件无法在 Alpine 运行
RUN apk add --no-cache ca-certificates tzdata libcap libbpf
COPY --from=builder /go/bin/sing-box /usr/local/bin/sing-box

ENTRYPOINT ["sing-box"]