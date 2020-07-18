FROM golang:1.14-alpine AS builder
RUN apk --no-cache add git bash curl
WORKDIR /go/src/v2ray.com/core
RUN git clone --progress https://github.com/v2fly/v2ray-core.git . && \
    bash ./release/user-package.sh nosource noconf codename=$(git describe --tags) buildname=docker-fly abpathtgz=/tmp/v2ray.tgz && \
    mkdir -p /tmp/v2ray && \
    tar xvfz /tmp/v2ray.tgz -C /tmp/v2ray

FROM playn/alpine:3.12.0
COPY --from=builder /tmp/v2ray /usr/bin
RUN apk --no-cache add ca-certificates

ENTRYPOINT ["/usr/bin/v2ray/v2ray"]
ENV PATH /usr/bin/v2ray:$PATH
#CMD ["v2ray", "-config=/etc/v2ray/config.json"]
