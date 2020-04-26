FROM ubuntu:16.04
RUN apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get upgrade -y
RUN dpkg --add-architecture i386
RUN apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get upgrade -y
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y --no-install-recommends \
    wine firefox
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y --no-install-recommends \
    libpulse0:i386
RUN useradd -s $(which bash) -m -U jakutis && usermod -a -G video jakutis
COPY pulse-client.conf /etc/pulse/client.conf
USER jakutis
WORKDIR /home/jakutis
ADD dot_wine_novideo.tar .
CMD []