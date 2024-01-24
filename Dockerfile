FROM ubuntu:20.04

LABEL maintainer "opsxcq@strm.sh"

COPY main.sh /

RUN apt-get update && \
    apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    python &&\
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*\
    chmod +x /main.sh

RUN mkdir /www

EXPOSE 80

WORKDIR /www

ENTRYPOINT ["/main.sh"]