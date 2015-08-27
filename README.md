# slacker_docker


Manual Builds:

in nginx

docker build -t thrawn/nginx:1.8 .

in php5

docker build -t thrawn/php5:5.5 .

in web

docker build -t thrawn/web:2.0 .


then

bash deploy.sh

then

docker run -d -p 80:80 --name web -v /srv/www:/srv/www:ro thrawn/web:2.0


or just do this:
make
docker run -d -p 80:80 --name web -v /srv/www:/srv/www:ro thrawn/web:2.0
