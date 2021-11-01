# OS
FROM	alpine:3.12

# Update and install
RUN		apk update && \
		apk add --no-cache nginx mysql-client && \
		apk add --no-cache php7 php7-fpm php7-mysqli php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session php-phar jq  && \
		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

# Copy the files into the container
COPY	./nginx.conf /etc/nginx/conf.d/default.conf
COPY	./nginx.conf /etc/nginx/nginx.conf
COPY	./wordpress_setup.sh ./
COPY	./telegraf.conf etc/telegraf/telegraf.conf

# Add user, make www dir and configure permissions
RUN		adduser -D -g 'www' www && \
		mkdir /www && \
		chown -R www:www /var/lib/nginx && \
		chown -R www:www /www && \
		mkdir -p /var/run/nginx && \
		chmod +x ./wordpress_setup.sh

# Download and install wp command line tool
RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN 	chmod +x wp-cli.phar
RUN 	mv wp-cli.phar /usr/local/bin/wp
RUN		mkdir -p /etc/telegraf

# Download the basic web package to /www
WORKDIR /www/
RUN 	wp core download
WORKDIR /

# Listen on port 5050
EXPOSE	5050

# Start
CMD		[ "bin/sh", "./wordpress_setup.sh" ]