# syntax=docker/dockerfile:1
FROM alpine:3.15.4
RUN apk add --no-cach --no-progress --virtual .build-deps tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    apk del .build-deps
