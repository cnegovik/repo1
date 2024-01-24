FROM ubuntu:20.04

LABEL maintainer "opsxcq@strm.sh"

COPY main.sh /
RUN mkdir /www

RUN apt-get update && \
    apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    python &&\
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*\
    chmod 775 /main.sh

EXPOSE 80

WORKDIR /www

ENTRYPOINT bash -c "while true; do echo hello; sleep 2; done"