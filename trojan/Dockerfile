FROM playn/alpine:latest AS builder
ARG trojan_version='v1.14.1'
RUN apk add --no-cache --virtual .build-deps \
        build-base \
        cmake \
        boost-dev \
        openssl-dev \
        mariadb-connector-c-dev \
        git && \
    git clone --branch=${trojan_version} https://github.com/trojan-gfw/trojan.git && \
    cd trojan && \
    cmake . && \
    make -j $(nproc) && \
    strip -s trojan

FROM playn/alpine:latest
RUN apk add --no-cache --virtual .trojan-rundeps \
        libstdc++ \
        boost-system \
        boost-program_options \
        mariadb-connector-c

COPY --from=builder /trojan/trojan /usr/local/bin
