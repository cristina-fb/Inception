#! /bin/sh

mv index.php ./var/www/html
php-fpm7.3 -F
