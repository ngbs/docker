FROM playn/alpine:3.12.0
ARG version=0.74.2
ADD https://github.com/gohugoio/hugo/releases/download/v${version}/hugo_${version}_Linux-64bit.tar.gz /tmp
RUN tar -xf /tmp/hugo_${version}_Linux-64bit.tar.gz -C /tmp && \
    mv /tmp/hugo /usr/local/bin/ && \
    rm /tmp/*
WORKDIR /src
VOLUME /src
