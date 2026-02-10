# syntax=docker/dockerfile:1
FROM alpine:latest
RUN apk add --no-cache --no-progress --virtual .build-deps tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    apk del .build-deps
