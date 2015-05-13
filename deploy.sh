#!/bin/bash -e

NOW=$(date +"%Y-%m-%d-%H-%M-%S")

if [ -e /srv/www ];
then
    mv /srv/www /srv/${NOW}
    git clone https://github.com/thrawn/slacker.git /srv/www
else
    git clone https://github.com/thrawn/slacker.git /srv/www
fi


PUBLIC=$(ec2metadata --public-hostname)

RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" ${PUBLIC})

echo ${RESPONSE}
