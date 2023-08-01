FROM ubuntu:20.04

MAINTAINER Suhui, <suhui@kokona.tech>

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install gnupg screen wget sudo git software-properties-common -y
RUN apt-get update
RUN wget "https://github.com/tsl0922/ttyd/releases/download/1.7.3/ttyd.x86_64" && mv ttyd.x86_64 /usr/bin/ttyd && chmod +x /usr/bin/ttyd
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /root
ENV LANG=C.UTF-8
EXPOSE 8080

CMD ["sh", "-c", "/usr/bin/ttyd -c ${USERNAME:-user}:${PASSWORD:-password} -p ${PORT:-8080} bash"]
