FROM playn/alpine as builder
RUN apk add --no-cache git  build-base linux-headers && \
    git clone --recursive https://github.com/wangyu-/tinyfecVPN.git  && \
    cd tinyfecVPN && \
    make nolimit_release

FROM playn/alpine
RUN apk add --no-cache libstdc++ iptables ip6tables
COPY --from=builder /tinyfecVPN/tinyvpn_amd64 /bin/tinyvpn
ENTRYPOINT [ "/bin/tinyvpn" ]
