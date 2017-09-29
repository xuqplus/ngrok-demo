FROM centos:6.8

MAINTAINER xuqplus

ENV NGROK_DOMAIN ngrok.xuqplus.space

RUN mkdir /var/ngrok -p
COPY ngrok/bin/ngrokd /
COPY ngrok/assets/server/tls/snakeoil.key /
COPY ngrok/assets/server/tls/snakeoil.crt /

EXPOSE 40080 40443 44443

CMD /ngrokd -domain=$NGROK_DOMAIN -httpAddr=:40080 -httpsAddr=:40443 -log=/var/ngrok/ngrok.log -log-level=ERROR -tunnelAddr=:44443 -tlsKey=/snakeoil.key -tlsCrt=/snakeoil.crt 
