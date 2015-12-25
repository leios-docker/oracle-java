# Pull base image.
FROM ubuntu:14.04

RUN locale-gen ko_KR.UTF-8
RUN update-locale LANG=ko_KR.UTF-8
RUN dpkg-reconfigure locales

ENV LANG ko_KR.UTF-8
ENV LC_ALL ko_KR.UTF-8

# Install curl
RUN \
    sed -ri 's/\/archive\.ubuntu\.com/\/kr\.archive\.ubuntu\.com/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:webupd8team/java && \
    apt-get update && \
    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
    apt-get install -y oracle-java8-installer && \
    apt-get install -y oracle-java8-set-default && \
    rm -rf /var/lib/apt/lists/*
