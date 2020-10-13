FROM golang:1.15.2-alpine3.12 AS builder

ARG SYNCTHING_RELEASE=v1.10.0
ENV CGO_ENABLED=0
ENV BUILD_HOST=syncthing.net
ENV BUILD_USER=docker
RUN apk add curl && \
    mkdir -p /tmp/src && \
    curl -o /tmp/syncthing-src.tar.gz -L "https://github.com/syncthing/syncthing/archive/${SYNCTHING_RELEASE}.tar.gz" && \
    tar xf /tmp/syncthing-src.tar.gz -C /tmp/src --strip-components=1 && \
    cd /tmp/src && \
    rm -f syncthing && go run build.go -no-upgrade -version=${SYNCTHING_RELEASE} build syncthing

FROM playn/alpine:3.12.0

ENV PUID=1000 PGID=1000 HOME=/var/syncthing
RUN apk add --no-cache ca-certificates su-exec

COPY --from=builder /tmp/src/syncthing /bin/syncthing
COPY --from=builder /tmp/src/script/docker-entrypoint.sh /bin/entrypoint.sh

EXPOSE 8384 22000 21027/udp
VOLUME ["/var/syncthing"]

#HEALTHCHECK --interval=1m --timeout=10s \
#  CMD nc -z 127.0.0.1 8384 || exit 1

ENV STGUIADDRESS=0.0.0.0:8384
ENTRYPOINT ["/bin/entrypoint.sh", "/bin/syncthing", "-home", "/var/syncthing/config"]