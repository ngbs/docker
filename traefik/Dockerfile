FROM playn/alpine:latest
ARG version=2.2.5
RUN apk --no-cache add ca-certificates
RUN set -ex; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		armhf) arch='armv6' ;; \
		aarch64) arch='arm64' ;; \
		x86_64) arch='amd64' ;; \
		*) echo >&2 "error: unsupported architecture: $apkArch"; exit 1 ;; \
	esac; \
	wget --quiet -O /tmp/traefik.tar.gz "https://github.com/containous/traefik/releases/download/v${version}/traefik_v${version}_linux_$arch.tar.gz"; \
	tar xzvf /tmp/traefik.tar.gz -C /usr/local/bin traefik; \
	rm -f /tmp/traefik.tar.gz; \
	chmod +x /usr/local/bin/traefik
COPY entrypoint.sh /
EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]
CMD ["traefik"]

# Metadata
LABEL org.opencontainers.image.vendor="Containous" \
	org.opencontainers.image.url="https://traefik.io" \
	org.opencontainers.image.title="Traefik" \
	org.opencontainers.image.description="A modern reverse-proxy" \
	org.opencontainers.image.version="v${version}" \
	org.opencontainers.image.documentation="https://docs.traefik.io"