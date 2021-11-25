FROM python:3.10.0-alpine3.14

#Base settings
ENV HOME /root
ENV ENABLE_TOR false

WORKDIR /root

#Install ZeroNet
RUN apk --update --no-cache --no-progress add tor openssl git gcc libffi-dev musl-dev make && \
    git clone --depth 1 https://github.com/HelloZeroNet/ZeroNet.git && \
    pip3 install -r /root/ZeroNet/requirements.txt && \
    apk --purge del git gcc libffi-dev musl-dev make && \
    echo "ControlPort 9051" >> /etc/tor/torrc && \
    echo "CookieAuthentication 1" >> /etc/tor/torrc && \
    python3 -V && \
    python3 -m pip list && \
    tor --version && \
    openssl version

VOLUME /root/ZeroNet/data

#Set upstart command
CMD (! ${ENABLE_TOR} || tor&) && python3 zeronet.py --ui_ip 0.0.0.0 --fileserver_port 26552

#Expose ports
EXPOSE 43110 26552