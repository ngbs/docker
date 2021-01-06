FROM golang:alpine AS builder
WORKDIR /go
ENV GO111MODULE on
RUN apk --no-cache --no-progress add make git && \
    git clone https://github.com/go-acme/lego.git && \
    cd /go/lego && make build

FROM playn/alpine
RUN apk add --no-cache ca-certificates && \
    update-ca-certificates
COPY --from=builder /go/lego/dist/lego /usr/bin/lego
ENTRYPOINT [ "/usr/bin/lego" ]