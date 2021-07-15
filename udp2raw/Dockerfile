FROM playn/alpine as builder
RUN apk add --no-cache git build-base linux-headers && \
    git clone --depth 1 https://github.com/wangyu-/udp2raw-tunnel.git  && \
    cd udp2raw-tunnel && \
    make dynamic

FROM playn/alpine
RUN apk add --no-cache libstdc++ iptables
COPY --from=builder /udp2raw-tunnel/udp2raw_dynamic /usr/local/bin/udp2raw
ENTRYPOINT [ "/usr/local/bin/udp2raw" ]