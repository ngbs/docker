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
# 必须开启 CGO，因为 BPF 和某些加密库需要它
ENV CGO_ENABLED=1

RUN set -ex && \
    # 增加 ca-certificates 以确保能从 GitHub 获取 tags
    apk add --no-cache git build-base linux-headers libcap-dev libbpf-dev wireguard-tools cmake libqrencode-dev wget ca-certificates && \
    \
    # 克隆 testing 分支
    git clone --depth 1 --branch testing https://github.com/sagernet/sing-box.git . && \
    \
    # 获取元数据
    export COMMIT=$(git rev-parse --short HEAD || echo "unknown") && \
    export VERSION=$(wget -qO- https://api.github.com/repos/sagernet/sing-box/tags | grep '"name":' | head -n 1 | sed -E 's/.*"([^"]+)".*/\1/' || echo "testing") && \
    \
    # 关键点：使用更稳健的构建标签，显式包含 with_realms
    # 同时去掉可能导致冲突的旧版标签
    go build -v -trimpath -tags \
        "with_quic,with_wireguard,with_utls,with_gvisor,with_clash_api,with_ech,with_acme,with_realms,with_low_memory" \
        -o /go/bin/sing-box \
        -ldflags "-X \"github.com/sagernet/sing-box/constant.Version=$VERSION\" -s -w -buildid=" \
        ./cmd/sing-box

FROM alpine:latest AS dist
# 运行时必须安装必要的动态库，否则单可执行文件无法运行
RUN apk add --no-cache ca-certificates tzdata libcap libbpf
COPY --from=builder /go/bin/sing-box /usr/local/bin/sing-box
ENTRYPOINT ["sing-box"]