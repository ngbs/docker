# syntax=docker/dockerfile:1
FROM golang:alpine AS builder
RUN apk --no-cache add git bash curl
WORKDIR /go/src/v2ray.com/core
RUN git clone --depth 1 --progress https://github.com/v2fly/v2ray-core.git . && \
    bash ./release/user-package.sh nosource noconf codename=$(git describe --tags) buildname=docker-fly abpathtgz=/tmp/v2ray.tgz && \
    mkdir -p /tmp/v2ray && \
    tar xvfz /tmp/v2ray.tgz -C /tmp/v2ray

FROM playn/alpine
COPY --from=builder /tmp/v2ray /usr/bin/v2ray
RUN apk --no-cache add ca-certificates

ENTRYPOINT ["/usr/bin/v2ray/v2ray"]
ENV PATH /usr/bin/v2ray:$PATH