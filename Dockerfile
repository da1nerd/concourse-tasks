FROM node:8.11.2

RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get upgrade -yq && apt-get install -yq locales zip unzip genisoimage
RUN npm install -g npm@6.0.1
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8

EXPOSE 3000

CMD ["/bin/bash"]
