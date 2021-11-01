# OS
FROM	alpine:3.12

# Update and install
RUN		apk update && \
		apk upgrade && \
		apk add mysql mysql-client && \
		apk add mariadb mariadb-client && \
		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

# Copy files to container
COPY	./mysql_setup.sh /tmp/mysql_setup.sh
COPY	./my.cnf ./etc/my.cnf
COPY	./telegraf.conf etc/telegraf/telegraf.conf

# Set permission
RUN 	chmod +x /tmp/mysql_setup.sh

# Make telegraf dir
RUN		mkdir -p /etc/telegraf

# Set volume to use
VOLUME	/var/lib/mysql

# Listen to port 3306
EXPOSE	3306

# Start
ENTRYPOINT	["bin/sh", "/tmp/mysql_setup.sh"]