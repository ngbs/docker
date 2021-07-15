# syntax=docker/dockerfile:1
FROM playn/alpine AS builder
# ARG version=2.0.46-beta3
RUN export version=$(wget -qO- -t1 -T2 "https://api.github.com/repos/dnscrypt/dnscrypt-proxy/releases/latest" | grep '"tag_name":' | head -n 1 | sed -E 's/.*"([^"]+)".*/\1/') && \
    wget -c https://github.com/dnscrypt/dnscrypt-proxy/releases/download/${version}/dnscrypt-proxy-linux_x86_64-${version}.tar.gz && \
    tar -zxf dnscrypt-proxy-linux_x86_64-${version}.tar.gz -C /tmp && \
    cd /tmp/linux-x86_64; \ls | awk -F "example-" '{print "mv "$0" "$1$2""}' | sh; \cd -; && \
    # mv /tmp/linux-x86_64/example-allowed-ips.txt /tmp/linux-x86_64/allowed-ips.txt && \
    # mv /tmp/linux-x86_64/example-allowed-names.txt /tmp/linux-x86_64/allowed-names.txt && \
    # mv /tmp/linux-x86_64/example-blocked-ips.txt /tmp/linux-x86_64/blocked-ips.txt && \
    # mv /tmp/linux-x86_64/example-blocked-names.txt /tmp/linux-x86_64/blocked-names.txt && \
    # mv /tmp/linux-x86_64/example-captive-portals.txt /tmp/linux-x86_64/captive-portals.txt && \
    # mv /tmp/linux-x86_64/example-cloaking-rules.txt /tmp/linux-x86_64/cloaking-rules.txt && \
    # mv /tmp/linux-x86_64/example-forwarding-rules.txt /tmp/linux-x86_64/forwarding-rules.txt && \
    # mv /tmp/linux-x86_64/example-dnscrypt-proxy.toml /tmp/linux-x86_64/dnscrypt-proxy.toml && \
    mv /tmp/linux-x86_64 /usr/local/bin/dnscrypt-proxy

FROM playn/alpine
COPY --from=builder --chown=0:0 /usr/local/bin/dnscrypt-proxy /usr/local/bin/dnscrypt-proxy
ENTRYPOINT [ "/usr/local/bin/dnscrypt-proxy/dnscrypt-proxy" ]