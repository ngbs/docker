# syntax=docker/dockerfile:1
FROM golang:alpine AS builder
# ADD https://github.com/FranzKafkaYu/x-ui/releases/download/0.3.3.16-0814/x-ui-linux-amd64.tar.gz /tmp
RUN apk --no-cache add git gcc g++
WORKDIR /go/src
RUN git clone --depth 1 https://github.com/FranzKafkaYu/x-ui.git . && \
    go build main.go && \
    export version=$(wget -qO- https://api.github.com/repos/FranzKafkaYu/x-ui/releases/latest | grep '"tag_name":' | head -n 1 | sed -E 's/.*"([^"]+)".*/\1/'); \
    wget --quiet -O /tmp "https://github.com/FranzKafkaYu/x-ui/releases/download/${version}/x-ui-linux-amd64.tar.gz"; \
    tar xzvf /tmp/x-ui-linux-amd64.tar.gz -C /tmp && \
    ls -la ./ && ls -la /tmp && \
    mkdir x-ui && \
    mv /tmp/x-ui/bin ./x-ui && \
    mv main ./x-ui/x-ui

FROM alpine
COPY --from=builder /go/src/x-ui /usr/local/bin/x-ui
RUN apk --no-cache add ca-certificates tzdata

ENTRYPOINT ["/usr/local/bin/x-ui/x-ui"]
# ENV PATH /usr/local/bin/x-ui/x-ui:$PATH