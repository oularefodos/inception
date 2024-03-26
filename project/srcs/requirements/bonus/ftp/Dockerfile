FROM alpine:3.17

RUN apk update && apk add vsftpd

WORKDIR /var/www

EXPOSE 21

COPY requirements/bonus/ftp/conf/config.sh /tmp/config.sh

ENTRYPOINT ["sh", "/tmp/config.sh"]