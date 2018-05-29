FROM node:8.11.2

ARG DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386 && \
    echo "deb http://httpredir.debian.org/debian jessie-backports main" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -yq software-properties-common

RUN apt-get update && \
    apt-get upgrade -yq

RUN apt-get install -yq locales zip unzip genisoimage wine wine32 wine64 libwine libwine:i386

RUN apt-get install -yq innoextract wine python-software-properties

RUN npm install -g npm@6.0.1

RUN mkdir /tmp/inno && \
    cd /tmp/inno && \
    wget -O is.exe http://files.jrsoftware.org/is/5/isetup-5.5.3.exe --no-check-certificate && \
    innoextract is.exe && \
    mkdir -p ~/".wine/drive_c/inno" && \
    cp -a app/* ~/".wine/drive_c/inno"


RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8

EXPOSE 3000

CMD ["/bin/bash"]
