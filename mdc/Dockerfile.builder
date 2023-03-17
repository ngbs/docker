# syntax=docker/dockerfile:1
FROM python:3.10-alpine

# Official Python base image is needed or some applications will segfault.
# PyInstaller needs zlib-dev, gcc, libc-dev, and musl-dev
RUN apk --update --no-cache add \
    zlib-dev \
    musl-dev \
    libc-dev \
    libffi-dev \
    gcc \
    g++ \
    git \
    make \
    cmake \
    pwgen \
    jpeg-dev \
    # mdc builder depenencies
    libxml2-dev \
    libxslt-dev \
    # download utils
    wget && \
    # update pip
    pip install --upgrade pip

# build bootloader for alpine
RUN mkdir -p /tmp/pyinstaller && \
    export PYINSTALLER_SOURCE_VERISON=$(wget -qO- https://api.github.com/repos/pyinstaller/pyinstaller/releases/latest | grep '"tag_name":' | head -n 1 | sed -E 's/.*"([^"]+)".*/\1/') && \
    wget -O- https://github.com/pyinstaller/pyinstaller/archive/$PYINSTALLER_SOURCE_VERISON.tar.gz | tar xz -C /tmp/pyinstaller --strip-components 1 && \
    cd /tmp/pyinstaller/bootloader && \
    CFLAGS="-Wno-stringop-overflow -Wno-stringop-truncation" python ./waf configure --no-lsb all && \
    pip install .. && \
    rm -Rf /tmp/pyinstaller

ADD /root/ /pyinstaller/
RUN chmod a+x /pyinstaller/*

# install requirements
RUN cd /tmp && \
    export MDC_REQUIREMENTS_SOURCE_VERSION=$(wget -qO- https://api.github.com/repos/yoshiko2/Movie_Data_Capture/releases/latest | grep '"tag_name":' | head -n 1 | sed -E 's/.*"([^"]+)".*/\1/') && \
    wget -O mdc_requirements.txt https://raw.githubusercontent.com/yoshiko2/Movie_Data_Capture/$MDC_REQUIREMENTS_SOURCE_VERSION/requirements.txt && \
    pip install -r mdc_requirements.txt