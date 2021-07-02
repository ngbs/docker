# syntax=docker/dockerfile:1
FROM playn/alpine AS builder
ARG version=2.0.46-beta3
RUN wget -c https://github.com/DNSCrypt/dnscrypt-proxy/releases/download/${version}/dnscrypt-proxy-linux_x86_64-${version}.tar.gz && \
    tar -zxf dnscrypt-proxy-linux_x86_64-${version}.tar.gz -C /tmp && \
    mv /tmp/linux-x86_64/example-allowed-ips.txt /tmp/linux-x86_64/allowed-ips.txt && \
    mv /tmp/linux-x86_64/example-allowed-names.txt /tmp/linux-x86_64/allowed-names.txt && \
    mv /tmp/linux-x86_64/example-blocked-ips.txt /tmp/linux-x86_64/blocked-ips.txt && \
    mv /tmp/linux-x86_64/example-blocked-names.txt /tmp/linux-x86_64/blocked-names.txt && \
    mv /tmp/linux-x86_64/example-captive-portals.txt /tmp/linux-x86_64/captive-portals.txt && \
    mv /tmp/linux-x86_64/example-cloaking-rules.txt /tmp/linux-x86_64/cloaking-rules.txt && \
    mv /tmp/linux-x86_64/example-forwarding-rules.txt /tmp/linux-x86_64/forwarding-rules.txt && \
    mv /tmp/linux-x86_64/example-dnscrypt-proxy.toml /tmp/linux-x86_64/dnscrypt-proxy.toml && \
    mv /tmp/linux-x86_64 /usr/local/bin/dnscrypt-proxy

FROM playn/alpine
COPY --from=builder --chown=0:0 /usr/local/bin/dnscrypt-proxy /usr/local/bin/dnscrypt-proxy
ENTRYPOINT [ "/usr/local/bin/dnscrypt-proxy/dnscrypt-proxy" ]