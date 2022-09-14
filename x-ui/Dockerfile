# syntax=docker/dockerfile:1
FROM golang:alpine AS builder

WORKDIR /go/src

RUN apk --no-cache add git gcc g++ && \
    git clone --depth 1 https://github.com/FranzKafkaYu/x-ui.git . && \
    go build main.go && \
    export version=$(wget -qO- https://api.github.com/repos/XTLS/Xray-core/releases/latest | grep '"tag_name":' | head -n 1 | sed -E 's/.*"([^"]+)".*/\1/'); \
    wget -P /tmp https://github.com/XTLS/Xray-core/releases/download/${version}/Xray-linux-64.zip; \
    unzip /tmp/Xray-linux-64.zip -d /tmp; \
    mv /tmp/xray /tmp/xray-linux-amd64; \
    ls -la ./ && ls -la /tmp && \
    mkdir x-ui && \
    mv /tmp/x-ui/bin ./x-ui && \
    mv main ./x-ui/x-ui

FROM alpine

COPY --from=builder /go/src/x-ui /usr/local/bin/x-ui
COPY --from=builder /tmp/*.dat /bin
COPY --from=builder /tmp/xray-linux-amd64 /bin

RUN apk --no-cache add ca-certificates tzdata

ENTRYPOINT ["/usr/local/bin/x-ui/x-ui"]
ENV PATH /usr/local/bin/x-ui/x-ui:$PATH