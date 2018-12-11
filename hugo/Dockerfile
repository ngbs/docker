FROM playn/alpine:edge

ARG version=0.40.3

ADD https://github.com/gohugoio/hugo/releases/download/v${version}/hugo_${version}_Linux-64bit.tar.gz /tmp

RUN tar -xf /tmp/hugo_${version}_Linux-64bit.tar.gz -C /tmp && \
    mv /tmp/hugo /usr/local/bin/ && \
    rm /tmp/*

WORKDIR /src
VOLUME /src