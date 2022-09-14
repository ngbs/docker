# syntax=docker/dockerfile:1
FROM golang:alpine AS builder
# WORKDIR /root
ADD https://github.com/FranzKafkaYu/x-ui/releases/download/0.3.3.16-0814/x-ui-linux-amd64.tar.gz /tmp
RUN apk --no-cache add git gcc g++
WORKDIR /go/src
# COPY . .
RUN git clone --depth 1 https://github.com/FranzKafkaYu/x-ui.git . && \
    go build main.go && \
    ls -la ./ && ls -la /tmp
    # mv /tmp/x-ui/bin ./main

# FROM debian:11-slim
# RUN apt-get update && apt-get install -y --no-install-recommends -y ca-certificates \
#     && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
# WORKDIR /root
# COPY --from=builder  /root/main /root/x-ui
# COPY bin/. /root/bin/.
# VOLUME [ "/etc/x-ui" ]
# CMD [ "./x-ui" ]
FROM playn/alpine
COPY --from=builder /go/src/main /usr/local/bin/x-ui
RUN apk --no-cache add ca-certificates

ENTRYPOINT ["/usr/local/bin/x-ui/x-ui"]
ENV PATH /usr/local/bin/x-ui/x-ui:$PATH