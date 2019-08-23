FROM golang:alpine AS build-env
ARG doh_version=2.1.1
RUN apk add --no-cache git make && \
    wget https://github.com/m13253/dns-over-https/archive/v${doh_version}.tar.gz && \
    tar zxf v${doh_version}.tar.gz && \
    mv ./dns-over-https-${doh_version} /src && \
    cd /src && \
    make doh-client/doh-client

FROM playn/alpine
COPY --from=build-env /src/doh-client/doh-client /doh-client

EXPOSE 53
EXPOSE 5380

ENTRYPOINT ["/doh-client"]
CMD ["-conf", "/doh-client.conf"]