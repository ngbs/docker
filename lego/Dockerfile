# syntax=docker/dockerfile:1
FROM playn/alpine
# ARG version=4.4.0
RUN export version=$(wget -qO- https://api.github.com/repos/go-acme/lego/releases/latest | grep '"tag_name":' | head -n 1 | sed -E 's/.*"([^"]+)".*/\1/'); \
    wget -P /tmp -c https://github.com/go-acme/lego/releases/download/${version}/lego_${version}_linux_amd64.tar.gz; \
    tar zxf /tmp/lego_${version}_linux_amd64.tar.gz -C /tmp; \
    mv /tmp/lego /usr/local/bin/lego; \
    rm -rf /tmp/*; \
    unset version
ENTRYPOINT ["/usr/local/bin/lego"]