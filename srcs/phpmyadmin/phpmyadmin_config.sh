wget https://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.1-all-languages.tar.gz 
tar -zvxf phpMyAdmin-5.0.1-all-languages.tar.gz --strip-components=1 -C /www
rm phpMyAdmin-5.0.1-all-languages.tar.gz
mv config.inc.php /www/config.inc.php