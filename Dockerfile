FROM ubuntu:20.04

MAINTAINER Suhui, <suhui@kokona.tech>

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install openjdk-11-jre-headless screen wget -y
RUN wget "https://github.com/tsl0922/ttyd/releases/download/1.6.3/ttyd.x86_64" && mv ttyd.x86_64 /usr/bin/ttyd && chmod +x /usr/bin/ttyd

WORKDIR /root
ENV LANG=C.UTF-8

CMD ["sh", "-c", "/usr/bin/ttyd -p $PORT bash"]
