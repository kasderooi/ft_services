# telegraf &
# influxd run -config /etc/influxdb.conf


# Start telegraf
/usr/bin/telegraf &

# Start influxdb
/usr/sbin/influxd & sleep 3

# Initialize database
influx -execute "CREATE DATABASE influxdb"
influx -execute "CREATE USER admin WITH PASSWORD 'password'"
influx -execute "GRANT ALL ON influxdb TO admin"

# Keep container running
tail -f /dev/null