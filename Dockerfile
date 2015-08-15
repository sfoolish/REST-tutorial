FROM ubuntu:14.04
MAINTAINER SFoolish <sfoolish.liang@gmail.com>

RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list

RUN apt-get update && apt-get install -y \
    curl \
    python \
    python-pip

COPY . /root/rest

RUN cd /root/rest && \
    pip install -r requirements.txt
