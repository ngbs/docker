FROM alpine:latest as builder
RUN apk add --no-cache git make build-base && \
    git clone --depth 1 --branch master --single-branch https://github.com/Wind4/vlmcsd.git && \
    cd vlmcsd && \
    make

FROM playn/alpine
COPY --from=builder /vlmcsd/bin/vlmcsd /usr/local/bin/vlmcsd
EXPOSE 1688/tcp
CMD [ "/usr/local/bin/vlmcsd", "-D", "-d" ]