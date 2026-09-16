# syntax=docker/dockerfile:1
FROM alpine:latest

ENV TZ=Asia/Shanghai

RUN apk update && apk upgrade --no-cache && \
    apk add --no-cache tzdata && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone