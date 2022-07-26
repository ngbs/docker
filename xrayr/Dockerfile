# syntax=docker/dockerfile:1
FROM golang:1.18.1-alpine AS builder
RUN apk --no-cache add git
WORKDIR /go/src
# RUN git clone https://github.com/long2k3pro/XrayR.git && cd XrayR && \
#     go mod download && \
#     go env -w GOFLAGS=-buildvcs=false && \
#     go build -v -o XrayR -trimpath -ldflags "-s -w -buildid=" ./main

RUN git clone https://github.com/long2k3pro/XrayR.git && cd XrayR/main && \
    go mod tidy && \
    go build -o XrayR -ldflags "-s -w"

FROM alpine

RUN apk --update --no-cache add tzdata ca-certificates && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    mkdir /etc/XrayR/
COPY --from=builder /go/src/XrayR/main/XrayR /usr/local/bin

ENTRYPOINT [ "XrayR", "--config", "/etc/XrayR/config.yml" ]