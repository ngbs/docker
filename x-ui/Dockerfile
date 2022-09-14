# syntax=docker/dockerfile:1
FROM golang:alpine AS builder
ADD https://github.com/XTLS/Xray-core/releases/download/v1.5.10/Xray-linux-64.zip /tmp
WORKDIR /go/src
RUN apk --no-cache add git gcc g++ && \
    git clone --depth 1 https://github.com/FranzKafkaYu/x-ui.git . && \
    go build main.go && \
    # export version=$(wget -qO- https://api.github.com/repos/XTLS/Xray-core/releases/latest | grep '"tag_name":' | head -n 1 | sed -E 's/.*"([^"]+)".*/\1/'); \
    # wget -P /tmp https://github.com/XTLS/Xray-core/releases/download/${version}/Xray-linux-64.zip; \
    unzip /tmp/Xray-linux-64.zip -d /tmp; \
    mv /tmp/xray /tmp/xray-linux-amd64; \
    ls -la ./ && ls -la /tmp

FROM alpine
COPY --from=builder /go/src/main /usr/local/bin/x-ui
COPY --from=builder /tmp/*.dat /tmp/xray-linux-amd64 /bin
RUN apk --no-cache add ca-certificates tzdata
VOLUME ["/etc/x-ui"]
ENTRYPOINT ["/usr/local/bin/x-ui"]
ENV PATH /usr/local/bin/x-ui:$PATH