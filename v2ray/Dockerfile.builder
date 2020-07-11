FROM golang:1.14-alpine AS builder
RUN go get -u v2ray.com/core/...
RUN cd $(go env GOPATH)/src/v2ray.com/core/main
RUN env CGO_ENABLED=0 go build -o $HOME/v2ray -ldflags "-s -w"
RUN cd $(go env GOPATH)/src/v2ray.com/core/infra/control/main
RUN env CGO_ENABLED=0 go build -o $HOME/v2ctl -tags confonly -ldflags "-s -w"

FROM playn/alpine:latest
COPY --from=builder $HOME/v2* /usr/bin/v2ray/