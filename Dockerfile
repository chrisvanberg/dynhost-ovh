FROM ubuntu:latest
RUN apt-get update && \
apt-get upgrade -y && \
apt-get install dnsutils curl -y && \
rm -rf /var/lib/apt/lists/*
RUN mkdir /srv/dynhost-ovh
WORKDIR /srv/dynhost-ovh
RUN ln -sf /dev/stdout /var/log/dynhost-ovh.log
COPY . ./
RUN ["chmod", "+x","dynhost.sh"]
ENTRYPOINT [ "./dynhost.sh" ]