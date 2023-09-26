#!/bin/sh

if ! wp core is-installed --allow-root --path=/var/www/; then
wp core install --url=$DOMAIN_NAME --title=Inception --admin_user=$WPADUSER --admin_password=$WPADPASS --admin_email=$WPADEMAIL --allow-root
wp user create $WPUSER1 $WPUSER1EMAIL --role=subscriber --user_pass=$WPUSER1PASS --allow-root
fi

# wp --allow-root --path=/var/www option update blogname "jyao inception project"
# wp --allow-root --path=/var/www option update blogdescription "The Inception of Things"
# wp --allow-root --path=/var/www option update blog_public 0

wp plugin update --all --allow-root

/usr/sbin/php-fpm81 -F