# syntax=docker/dockerfile:1
FROM golang:1.18.1-alpine AS builder
WORKDIR /go/src
ENV CGO_ENABLED=0
RUN apk --no-cache add git && \
    git clone https://github.com/realldz/XrayR.git && cd XrayR/main && \
    go mod download && \
    go env -w GOFLAGS=-buildvcs=false && \
    go build -v -o XrayR -trimpath -ldflags "-s -w -buildid=" && \
    mkdir -p /go/src/XrayR/Release && mv config.yml.example config.yml && \
    mv *.yml *.json *.dat rulelit XrayR /go/src/XrayR/Release

FROM alpine
RUN apk --update --no-cache add tzdata ca-certificates && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    mkdir /etc/XrayR/
COPY --from=builder /go/src/XrayR/Release /usr/local/bin

ENTRYPOINT [ "XrayR", "--config", "/etc/XrayR/config.yml" ]