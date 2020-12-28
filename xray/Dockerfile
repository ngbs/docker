FROM golang:alpine AS builder
RUN apk --no-cache add git
WORKDIR /go/src
RUN git clone https://github.com/XTLS/Xray-core.git . && \
    CGO_ENABLED=0 go build -o xray -trimpath -ldflags "-s -w -buildid=" ./main

FROM playn/alpine
COPY --from=builder /go/src/xray /usr/bin/xray
RUN apk --no-cache add ca-certificates

ENTRYPOINT ["/usr/bin/xray/xray"]
ENV PATH /usr/bin/xray:$PATH