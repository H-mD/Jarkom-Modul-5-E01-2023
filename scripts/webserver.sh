#!/bin/bash

apt-get update
apt-get install nginx php php-fpm netcat -y

echo -e "
server {
        listen 80;

        root /var/www/html;

        index index.php;

        #server_name sein.e01.com www.sein.e01.com;
        #server_name stark.e01.com www.stark.e01.com;

        location / {
                try_files \$uri \$uri/ /index.php?\$query_string;
        }

        location ~ \\.php$ {
                include snippets/fastcgi-php.conf;
                fastcgi_pass unix:/run/php/php7.3-fpm.sock;
        }

        location ~ /\\.ht {
               deny all;
        }

        error_log /var/log/nginx/e01_error.log;
        access_log /var/log/nginx/e01_access.log;
}
" > /etc/nginx/sites-available/default

echo -e "
<?php
\$hostname = gethostname();
\$date = date('Y-m-d H:i:s');
\$php_version = phpversion();
\$username = get_current_user();



echo \"Hello World!<br>\";
echo \"Saya adalah: \$username<br>\";
echo \"Saat ini berada di: \$hostname<br>\";
echo \"Versi PHP yang saya gunakan: \$php_version<br>\";
echo \"Tanggal saat ini: \$date<br>\";
?>
" > /var/www/html/index.php

service nginx restart
service php7.3-fpm start