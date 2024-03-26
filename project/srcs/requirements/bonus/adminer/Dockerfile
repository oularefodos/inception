FROM alpine:3.16

ARG VERSION=8

RUN apk update && apk upgrade && apk add \
    php${VERSION}-imap \
    php${VERSION}-cgi \
    php${VERSION}-pdo \
    php${VERSION}-pdo_mysql \
    php${VERSION}-soap \
    php${VERSION}-posix \
    php${VERSION}-gettext \
    php${VERSION}-ldap \
    php${VERSION}-ctype \
    php${VERSION}-dom \
    php${VERSION}-simplexml \
    php${VERSION} \
    php${VERSION}-common \
    php${VERSION}-session \
    php${VERSION}-iconv \
    php${VERSION}-gd \
    php${VERSION}-curl \
    php${VERSION}-xml \
    php${VERSION}-mysqli \
    wget

WORKDIR /var/www

RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php && \
    mv adminer-4.8.1.php index.php && chown -R root:root /var/www/

EXPOSE 8080

CMD	[ "php", "-S", "[::]:8080", "-t", "/var/www" ]