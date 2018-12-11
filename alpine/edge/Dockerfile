# 1.Disabling Cache
#   apk add --no-cach
# 2.Virtual Packages
#   apk --update add --virtual
# ----------------------------
#   apk update
#   apk upgrade
#   apk del --purge (rm -rf /var/cache/apk/*)

FROM alpine:edge

RUN apk --update add --no-cach tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    apk del --purge tzdata && \
    rm -rf /var/cache/apk/*