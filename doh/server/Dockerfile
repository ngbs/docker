FROM golang:alpine AS build-env
ARG doh_version=2.1.1
RUN apk add --no-cache git make && \
    wget https://github.com/m13253/dns-over-https/archive/v${doh_version}.tar.gz && \
    tar zxf v${doh_version}.tar.gz && \
    mv ./dns-over-https-${doh_version} /src && \
    cd /src && \
    make doh-server/doh-server

FROM playn/alpine:3.12.0
COPY --from=build-env /src/doh-server/doh-server /doh-server

EXPOSE 8053

ENTRYPOINT ["/doh-server"]
CMD ["-conf", "/doh-server.conf"]