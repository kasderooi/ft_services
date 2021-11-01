# OS
FROM	alpine:3.12

# Update and install
RUN		apk update && \
		apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache && \
		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

# Make telegraf dir
RUN		mkdir -p /etc/telegraf

# Copy files to container
COPY	./telegraf.conf etc/telegraf/telegraf.conf
COPY	./grafana_setup.sh ./grafana_setup.sh
COPY	./grafana.db ./usr/share/grafana/data/grafana.db

# Set permissions
RUN		chmod +x ./grafana_setup.sh

# Listen on port 3000
EXPOSE	3000

# Start
CMD 	[ "bin/sh", "grafana_setup.sh" ]