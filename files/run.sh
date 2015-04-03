#!/bin/sh

# expose config directory
[ ! -d /DATA/config ] \
      && mkdir -p /DATA/config \
      && chown -R nginx:www-data /DATA/config \
      && chmod -R 0770 /DATA/config
[ -d /usr/share/webapps/owncloud/config ] && rm -rf /usr/share/webapps/owncloud/config
ln -s /DATA/config /usr/share/webapps/owncloud/config

# create default config.php
[ ! -f /DATA/config/config.php ] \
      && mv /tmp/config.php /DATA/config/config.php \
      && chown nginx:www-data /DATA/config/config.php

# copy owncloud autoconfig.php
[ "`grep "'installed' => false" /DATA/config/config.php`" != "" ] \
      && [ -f /tmp/autoconfig.php ] \
      && mv /tmp/autoconfig.php /DATA/config/autoconfig.php \
      && chown nginx:www-data /DATA/config/autoconfig.php

# owncloud data directory
[ ! -d /DATA/data ] \
      && mkdir -p /DATA/data \
      && chown -R nginx:www-data /DATA/data \
      && chmod -R 0770 /DATA/data      

# owncloud app directory
[ ! -d /DATA/apps ] \
      && mkdir -p /DATA/apps \
      && chown -R nginx:www-data /DATA/apps \
      && chmod -R 0770 /DATA/apps
      
# fix owncloud bugs
mv /usr/share/webapps/owncloud/apps/calendar-* /usr/share/webapps/owncloud/apps/calendar
mv /usr/share/webapps/owncloud/apps/contacts-* /usr/share/webapps/owncloud/apps/contacts

# owncloud log directory
[ ! -d /DATA/logs/owncloud ] \
      && mkdir -p /DATA/logs/owncloud \
      && chown nginx:www-data /DATA/logs/owncloud \
      && chmod 0770 /DATA/logs/owncloud


# start php-fpm
mkdir -p /DATA/logs/php-fpm
php-fpm

# start nginx
mkdir -p /DATA/logs/nginx
mkdir -p /tmp/nginx
chown nginx /tmp/nginx 
nginx