# OS
FROM	alpine:3.12

# Update and install
RUN		apk update; \
		apk add --no-cache influxdb && \
		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

# Make telegraf dir
RUN		mkdir -p /etc/telegraf

# Copy files to container
COPY	./telegraf.conf etc/telegraf/telegraf.conf
COPY	./influxdb_setup.sh ./influxdb_setup.sh

# Set permissions
RUN		chmod +x ./influxdb_setup.sh

# Listen to port 8086
EXPOSE	8086

# Start
CMD 	[ "bin/sh", "influxdb_setup.sh" ]