#!/bin/bash -e

NOW=$(date +"%Y-%m-%d-%H-%M-%S")

if [ -e /srv/www ];
then
    mv /srv/www /srv/${NOW}
    git clone https://github.com/thrawn/slacker.git /srv/www
else
    git clone https://github.com/thrawn/slacker.git /srv/www
fi

meta=$(ec2metadata --local-hostname)

echo "<pre>$meta</pre>" >> /srv/www/index.php
echo "</html>" >> /srv/www/index.php

# restart the "web" container
running=$(docker ps -a | grep web)
if [[ "$running" ]]; then
docker stop web
docker rm web
docker run -d -p 80:80 --name web -v /srv/www:/srv/www:ro thrawn/web:2.0
else
docker run -d -p 80:80 --name web -v /srv/www:/srv/www:ro thrawn/web:2.0
fi
