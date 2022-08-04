# syntax=docker/dockerfile:1
FROM golang:1.18.1-alpine AS builder
WORKDIR /go/src
ENV CGO_ENABLED=0
RUN apk --no-cache add git && \
    git clone https://github.com/crossfw/Air-Universe.git && cd cmd/Air-Universe && \
    go mod download && \
    go env -w GOFLAGS=-buildvcs=false && \
    go build -v -o au -trimpath -ldflags "-s -w -buildid="

FROM alpine
RUN apk --update --no-cache add tzdata ca-certificates && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    mkdir /etc/au/ && mkdir -p /usr/local/share/au/
COPY --from=builder /go/src/Air-Universe/cmd/Air-Universe/au /usr/local/bin

ENTRYPOINT [ "au", "-c", "/etc/au/config.json"]