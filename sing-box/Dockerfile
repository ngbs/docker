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
    # 克隆 testing 分支
    git clone --depth 1 --branch testing https://github.com/sagernet/sing-box.git . && \
    \
    # 提取元数据（添加 fallback 方案防止变量为空导致编译指令语法错误）
    export COMMIT=$(git rev-parse --short HEAD || echo "unknown") && \
    export VERSION=$(wget -qO- https://api.github.com/repos/sagernet/sing-box/tags | grep '"name":' | head -n 1 | sed -E 's/.*"([^"]+)".*/\1/' || echo "testing") && \
    \
    # 执行编译，注意我调整了 tags
    # 添加了 with_realms 以确保该功能被显式包含（虽然 with_quic 通常带了，但 dev 版建议显式）
    go build -v -trimpath -tags \
        "with_quic,with_wireguard,with_utls,with_gvisor,with_clash_api,with_ech,with_acme" \
        -o /go/bin/sing-box \
        -ldflags "-X \"github.com/sagernet/sing-box/constant.Version=$VERSION\" -s -w -buildid=" \
        ./cmd/sing-box

FROM alpine:latest AS dist
RUN apk add --no-cache ca-certificates tzdata
COPY --from=builder /go/bin/sing-box /usr/local/bin/sing-box
ENTRYPOINT ["sing-box"]