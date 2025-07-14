FROM golang:1.24.2-alpine
RUN apk add --no-cache git gcc musl-dev
COPY builder.sh /usr/bin/builder.sh
CMD ["/bin/sh", "/usr/bin/builder.sh"]