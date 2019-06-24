FROM ubuntu

# aliyun
ADD sources.list /etc/apt/sources.list

# timezone apt-utils Locales
ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Asia/Shanghai \
    LANG=en_US.utf8

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --assume-yes \
            apt-utils \
            locales && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* \
           /var/tmp/* \
           /tmp/*