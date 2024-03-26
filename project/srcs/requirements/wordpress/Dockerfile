FROM debian:buster

RUN apt-get update && apt-get install -y wget php-fpm php-mysql mariadb-client php-redis

RUN sed -i "s|listen = /run/php/php7.3-fpm.sock|listen = 9000|g" etc/php/7.3/fpm/pool.d/www.conf


RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN cp wp-cli.phar /usr/local/bin/wp

COPY ./requirements/wordpress/conf/wp-config-create.sh /tmp/wp-config-create.sh
ENTRYPOINT ["sh", "/tmp/wp-config-create.sh"]
