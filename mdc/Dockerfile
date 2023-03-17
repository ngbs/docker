# syntax=docker/dockerfile:1
FROM playn/mdc-buildimage:dev as builder

RUN mkdir -p /tmp/mdc && cd /tmp/mdc && \
    # get mdc source code
    export MDC_SOURCE_VERSION=$(wget -qO- https://api.github.com/repos/yoshiko2/Movie_Data_Capture/releases/latest | grep '"tag_name":' | head -n 1 | sed -E 's/.*"([^"]+)".*/\1/') && \
    wget -O- https://github.com/yoshiko2/Movie_Data_Capture/archive/$MDC_SOURCE_VERSION.tar.gz | tar xz -C /tmp/mdc --strip-components 1 && \
    # fix dowload error
    sed -i "s/if configProxy:/if configProxy.enable:/g" core.py && \
    # build mdc
    /pyinstaller/pyinstaller.sh \
        --onefile Movie_Data_Capture.py \
        --hidden-import "ImageProcessing.cnn" \
        --add-data "Img:Img" \
        --add-data "$(python -c 'import cloudscraper as _; print(_.__path__[0])' | tail -n 1):cloudscraper" \
        --add-data "$(python -c 'import opencc as _; print(_.__path__[0])' | tail -n 1):opencc" \
        --add-data "$(python -c 'import face_recognition_models as _; print(_.__path__[0])' | tail -n 1):face_recognition_models"

FROM playn/alpine

RUN apk --update --no-cache add \
    libxcb

ENV TZ="Asia/Shanghai"
ENV UID=99
ENV GID=100
ENV UMASK=002

ADD /entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh && \
    mkdir -p /app && \
    mkdir -p /data && \
    mkdir -p /config && \
    # useradd -d /config -s /bin/sh mdc && \
    adduser -d /config && \
    chown -R mdc /config && \
    chown -R mdc /data

COPY --from=builder /tmp/mdc/dist/Movie_Data_Capture /app
COPY --from=builder /tmp/mdc/config.ini /app/config.template

VOLUME [ "/data", "/config" ]

ENTRYPOINT ["/entrypoint.sh"]