#
# Builder
#
FROM playn/caddy:builder as builder

ARG version="1.0.1"
ARG plugins="realip,cloudflare"
ARG enable_telemetry="true"

# process wrapper
RUN go get -v github.com/abiosoft/parent

RUN VERSION=${version} PLUGINS=${plugins} ENABLE_TELEMETRY=${enable_telemetry} /bin/sh /usr/bin/builder.sh

#
# Final stage
#
FROM playn/alpine:latest

RUN apk add --no-cache \
    ca-certificates

# install caddy
COPY --from=builder /install/caddy /usr/bin/caddy
# install process wrapper
COPY --from=builder /go/bin/parent /bin/parent

ENTRYPOINT ["/bin/parent", "caddy"]
CMD ["--conf", "/etc/Caddyfile", "--log", "stdout", "--agree=$ACME_AGREE"]