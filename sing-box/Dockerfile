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
    # 安装必要依赖，添加 wget 和 ca-certificates 确保能访问 GitHub API
    apk add --no-cache git build-base linux-headers libcap-dev libbpf-dev wireguard-tools cmake libqrencode-dev wget ca-certificates && \
    \
    # 1. 必须先克隆代码，才能进入目录获取 COMMIT 信息
    git clone --depth 1 --branch testing https://github.com/sagernet/sing-box.git . && \
    \
    # 2. 在代码目录内提取元数据
    export COMMIT=$(git rev-parse --short HEAD) && \
    export VERSION=$(wget -qO- https://api.github.com/repos/sagernet/sing-box/tags | grep '"name":' | head -n 1 | sed -E 's/.*"([^"]+)".*/\1/') && \
    \
    # 3. 执行编译
    # 建议添加 with_ech, with_dhcp, with_remote_control 等新版本特性
    go build -v -trimpath -tags \
        "with_gvisor,with_quic,with_wireguard,with_utls,with_acme,with_clash_api,with_grpc,with_ech,with_v2ray_api" \
        -o /go/bin/sing-box \
        -ldflags "-X \"github.com/sagernet/sing-box/constant.Version=$VERSION\" -s -w -buildid=" \
        ./cmd/sing-box

FROM alpine:latest AS dist
# 保持轻量，安装必要的运行时依赖（如 ca-certificates）
RUN apk add --no-cache ca-certificates tzdata
COPY --from=builder /go/bin/sing-box /usr/local/bin/sing-box

ENTRYPOINT ["sing-box"]
