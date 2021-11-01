# rc-status
# rc-service nginx start
# rc-status

# /etc/init.d/sshd start &

# nginx -s stop
# nginx -g 'daemon off;' &
# telegraf

# while true; do
# 	sleep 10
# 	ps | grep nginx | grep master
# 	if [ $? == 1 ]; then break
# 	fi
# done

nginx &
/usr/sbin/sshd &
telegraf &

while true; do
	sleep 10
	ps | grep nginx | grep master
	if [ $? == 1 ]; then break
	fi
	ps | grep sshd | grep listener
	if [ $? == 1 ]; then break
	fi
done