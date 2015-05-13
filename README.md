# slacker_docker

cd nginx
docker build -t thrawn/nginx:1.8 .
cd php5
docker build -t thrawn/php5:5.5 .
cd web
docker build -t thrawn/web:2.0 .

then

bash deploy.sh

then

docker run -d -p 80:80 --name web -v /srv/www:/srv/www:ro thrawn/web:2.0
