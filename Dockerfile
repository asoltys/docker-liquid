FROM debian:stable-slim
RUN apt-get update && apt-get install -y wget curl libzmq3-dev build-essential libtool autotools-dev automake pkg-config bsdmainutils python3 libssl-dev libevent-dev libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-test-dev libboost-thread-dev libdb-dev libdb++-dev

RUN mkdir -p /tmp /scripts

ADD install /scripts

RUN /scripts/install

RUN useradd -ms /bin/bash ubuntu

USER ubuntu

EXPOSE 18884 18886

ENTRYPOINT ["elementsd", "-datadir=/config"]
