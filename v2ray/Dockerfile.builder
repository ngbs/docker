FROM golang:1.14-alpine AS builder
RUN go get -u v2ray.com/core/... && \
      cd $(go env GOPATH)/src/v2ray.com/core/main && \
      env CGO_ENABLED=0 go build -o $HOME/v2ray -ldflags "-s -w" && \
      cd $(go env GOPATH)/src/v2ray.com/core/infra/control/main && \
      env CGO_ENABLED=0 go build -o $HOME/v2ctl -tags confonly -ldflags "-s -w"

FROM playn/alpine:latest
COPY --from=builder $HOME/v2* /usr/bin/