FROM playn/alpine as builder
RUN apk add --no-cache git build-base linux-headers && \
    git clone --recursive https://github.com/wangyu-/tinyfecVPN.git  && \
    cd tinyfecVPN && \
    sed -i '11s/^/#define NOLIMIT/g' tun_dev.h && \
    make nolimit

FROM playn/alpine
RUN apk add --no-cache iptables
COPY --from=builder /tinyfecVPN/tinyvpn /usr/bin/tinyvpn
ENTRYPOINT [ "/usr/bin/tinyvpn" ]