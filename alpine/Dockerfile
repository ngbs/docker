FROM alpine:latest

RUN set -x && \
    #apk --update upgrade && \
    apk add --no-cach tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    apk del --purge tzdata && \
    rm -rf /var/cache/apk/*