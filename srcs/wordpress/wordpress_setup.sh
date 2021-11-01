cd /www
while :
do
    mysqladmin -h mysql ping
    if [ $? == 0 ]
    then
        break
    fi
    sleep 10
done

wp config create --dbname=wordpress --dbuser=mysql --dbpass=password --dbhost=mysql:3306
wp core install --title=wordpress --admin_email=kde-rooi@student.codam.nl --skip-email --admin_user=admin --admin_password=password --url=192.168.99.108:5050
wp user create user1 user1@student.codam.nl --user_pass=user1
wp user create user2 user2@student.codam.nl --user_pass=user2
wp user create user3 user3@student.codam.nl --user_pass=user3

php-fpm7 &
nginx &
telegraf &

while true; do
	sleep 10
	ps | grep nginx | grep master
	if [ $? == 1 ]; then break
	fi
	ps | grep php-fpm | grep master
	if [ $? == 1 ]; then break
	fi
done