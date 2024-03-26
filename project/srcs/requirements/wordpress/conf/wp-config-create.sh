#!bin/sh

cd /var/www

if [ ! -f /var/www/wp-config.php ]; then

wp core download --allow-root --path=/var/www

chown -R www-data:www-data /var/www

runuser -u www-data -- wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=mariadb --path=/var/www
runuser -u www-data -- wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_NAME --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL --path=/var/www
runuser -u www-data -- wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASS --path=/var/www
runuser -u www-data -- wp theme install astra --activate --path=/var/www

runuser -u www-data -- wp plugin install redis-cache --activate --path=/var/www

runuser -u www-data -- wp config set WP_REDIS_HOST 'redis' --path=/var/www
runuser -u www-data -- wp config set WP_REDIS_PORT 6379 --path=/var/www

runuser -u www-data -- wp plugin update --all --path=/var/www

fi
mkdir /run/php
runuser -u www-data -- wp redis enable --force --path=/var/www
/usr/sbin/php-fpm7.3 -F
