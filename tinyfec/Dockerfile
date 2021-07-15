# syntax=docker/dockerfile:1
FROM playn/alpine as builder
RUN apk add --no-cache git build-base linux-headers && \
    git clone --depth 1 --recursive https://github.com/wangyu-/tinyfecVPN.git  && \
    cd tinyfecVPN && \
    sed -i '11s/^/#define NOLIMIT/g' tun_dev.h && \
    make nolimit

FROM playn/alpine
RUN apk add --no-cache iptables
COPY --from=builder /tinyfecVPN/tinyvpn /usr/local/bin/tinyvpn
ENTRYPOINT [ "/usr/local/bin/tinyvpn" ]