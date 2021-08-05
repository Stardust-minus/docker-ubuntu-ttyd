FROM ubuntu:20.04

MAINTAINER Suhui, <suhui@kokona.tech>

RUN wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add -
RUN add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install adoptopenjdk-11-openj9-jre screen wget sudo git -y
RUN wget "https://github.com/tsl0922/ttyd/releases/download/1.6.3/ttyd.x86_64" && mv ttyd.x86_64 /usr/bin/ttyd && chmod +x /usr/bin/ttyd
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /root
ENV LANG=C.UTF-8

CMD ["sh", "-c", "/usr/bin/ttyd -p $PORT bash"]
