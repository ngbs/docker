FROM playn/alpine:3.12.0
RUN apk --no-cache add samba samba-common-tools supervisor && \
    mkdir /config /shared && \
    addgroup -g 1000 playn && \
    adduser -D -H -G playn -s /bin/false -u 1000 playn && \
    echo -e "12345\n12345" | smbpasswd -a -s -c /config/smb.conf playn
COPY *.conf /config/
ENTRYPOINT ["supervisord", "-c", "/config/supervisord.conf"]
