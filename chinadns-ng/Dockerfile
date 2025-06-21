# syntax=docker/dockerfile:1
FROM alpine:latest AS builder
RUN apk add --no-cache \
    git \
    xz \
    wget \
    make
RUN wget https://ziglang.org/download/0.10.1/zig-linux-x86_64-0.10.1.tar.xz && \
    tar xvf zig-linux-x86_64-0.10.1.tar.xz && \
    mv zig-linux-x86_64-0.10.1 /zig && \
    rm zig-linux-x86_64-0.10.1.tar.xz
ENV PATH="/zig:${PATH}"
RUN git clone https://github.com/zfl9/chinadns-ng && \
    cd chinadns-ng && \
    zig build -Dtarget=x86_64-linux-musl -Dcpu=x86_64 && \
    mkdir -p /output && \
    cp zig-out/bin/chinadns-ng /output/

FROM alpine:latest
COPY --from=builder /output/chinadns-ng /usr/local/bin/
RUN apk --no-cache --no-progress add ipset nftables
RUN chinadns-ng --version
ENTRYPOINT ["/usr/local/bin/chinadns-ng"]