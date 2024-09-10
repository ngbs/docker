# syntax=docker/dockerfile:1
FROM playn/alpine
RUN apk add --no-cache --no-progress ca-certificates; \
    export version=$(wget -qO- https://api.github.com/repos/containous/traefik/releases/latest | grep '"tag_name":' | head -n 1 | sed -E 's/.*"([^"]+)".*/\1/'); \
    wget --quiet -O /tmp/traefik.tar.gz "https://github.com/containous/traefik/releases/download/${version}/traefik_${version}_linux_$arch.tar.gz"; \
    tar xzvf /tmp/traefik.tar.gz -C /usr/local/bin traefik; \
    rm -f /tmp/traefik.tar.gz; \
    chmod +x /usr/local/bin/traefik

COPY entrypoint.sh /
EXPOSE 80
ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["traefik"]