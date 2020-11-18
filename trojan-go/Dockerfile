FROM golang:alpine AS builder
WORKDIR /
RUN apk add git make &&\
        git clone https://github.com/p4gefau1t/trojan-go.git &&\
        cd trojan-go &&\
        make &&\
        wget https://github.com/v2ray/domain-list-community/raw/release/dlc.dat -O build/geosite.dat &&\
        wget https://github.com/v2ray/geoip/raw/release/geoip.dat -O build/geoip.dat

FROM playn/alpine
WORKDIR /
COPY --from=builder /trojan-go/build /usr/bin/
COPY --from=builder /trojan-go/example/server.json /etc/trojan-go/config.json

ENTRYPOINT ["/usr/bin/trojan-go"]
CMD ["-config", "/etc/trojan-go/config.json"]
