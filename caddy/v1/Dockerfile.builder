FROM golang:1.16.4-alpine
RUN apk add --no-cache git gcc musl-dev
COPY builder.sh /usr/bin/builder.sh
CMD ["/bin/sh", "/usr/bin/builder.sh"]