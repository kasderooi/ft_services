# OS
FROM	alpine:3.12

# Update and install
RUN		apk update && \
		apk add --no-cache wget && \
		apk add --no-cache nginx mysql-client && \
		apk add --no-cache php7 php7-fpm php7-opcache && \
		apk add --no-cache php7-gd php7-mysqli php7-zlib php7-curl && \
		apk add --no-cache php7-mbstring php7-json php7-session php7-zip && \
		apk add --no-cache php-phar jq && \
		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

# Copy all files into the container
COPY	./nginx.conf /etc/nginx/nginx.conf
COPY	./phpmyadmin_config.sh ./
COPY	./phpmyadmin_setup.sh ./
COPY	./config.inc.php ./
COPY	./telegraf.conf etc/telegraf/telegraf.conf

# Make all directory's
RUN		mkdir -p /www && \
		mkdir -p /www/phpmyadmin && \
		mkdir -p /www/tmp && \
		mkdir -p /www/phpmyadmin/tmp && \
		mkdir -p /run/nginx && \
		mkdir -p /etc/telegraf

# Add user and configure permissions
RUN		adduser -D -g 'www' www && \
		chown -R www:www /var/lib/nginx && \
		chown -R www:www /www && \
		chown -R www:www /www/tmp && \
		chown -R www:www /www/phpmyadmin/tmp && \
		chmod +x ./phpmyadmin_config.sh && \
		chmod +x ./phpmyadmin_setup.sh && \
		chmod +x ./config.inc.php && \
		chmod +x /www

# Download and configure phpmyadmin
# RUN		sh phpmyadmin_config.sh
RUN		wget https://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.1-all-languages.tar.gz && \
		tar -zvxf phpMyAdmin-5.0.1-all-languages.tar.gz --strip-components=1 -C /www && \
		rm phpMyAdmin-5.0.1-all-languages.tar.gz && \
		mv config.inc.php /www/config.inc.php

# Listen on port 5000
EXPOSE	5000

# Start
ENTRYPOINT ["bin/sh", "phpmyadmin_setup.sh"]