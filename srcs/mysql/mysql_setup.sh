mysql_install_db --user=mysql --datadir=/var/lib/mysql

:> /tmp/sql

if [ ! -d “/run/mysqld” ]; then
    mkdir -p /run/mysqld
    chown -R mysql:mysql /run/mysqld
fi

chown -R mysql:mysql /var/lib/mysql

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" >> /tmp/sql
echo "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';" >> /tmp/sql
echo "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS' WITH GRANT OPTION;" >> /tmp/sql
echo "FLUSH PRIVILEGES;" >> /tmp/sql

telegraf &
/usr/bin/mysqld --user=mysql --console --init_file=/tmp/sql