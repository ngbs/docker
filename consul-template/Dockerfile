FROM hashicorp/consul-template:alpine
USER root
RUN apk add --no-cache curl ca-certificates
#COPY --from=ghcr.io/sagernet/sing-box:latest /usr/local/bin/sing-box /usr/local/bin/sing-box
#RUN chmod +x /usr/local/bin/sing-box
USER consul-template