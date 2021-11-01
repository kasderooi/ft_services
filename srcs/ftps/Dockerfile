# OS
FROM	alpine:3.12

# Update and install
RUN		apk update; \
		apk add --no-cache vsftpd openssl jq && \
		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

# Configure ftps
RUN		mkdir -p /ftps && \
		adduser -D 'admin' -h /ftps && \
		echo "admin:password" | chpasswd

# Copy files into the container
COPY	./telegraf.conf etc/telegraf/telegraf.conf
COPY	./ftps_setup.sh ./ftps_setup.sh

# Make telegraf dir
RUN		mkdir -p /etc/telegraf

# Set permissions
RUN		chmod +x ftps_setup.sh

# Generate ssl 
RUN 	openssl req -x509 -nodes -days 365 -subj "/C=HA/ST=NH/O=Codam, Inc./CN=localhost" -addext "subjectAltName=DNS:localhost" -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt

# Copy ftps config file
COPY	./vsftpd.conf /etc/vsftpd/vsftpd.conf

# Listen to port 21 10000
EXPOSE	21 10000

# Start
CMD 	[ "bin/sh", "ftps_setup.sh" ]