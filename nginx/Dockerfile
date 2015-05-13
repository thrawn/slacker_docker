FROM phusion/baseimage:latest

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv-keys C300EE8C; \
  echo 'deb http://ppa.launchpad.net/nginx/stable/ubuntu trusty main' > /etc/apt/sources.list.d/nginx-stable-trusty.list; \
  apt-get update && apt-get install -y nginx && apt-get clean; \
  rm -rf /var/lib/apt/lists/*

RUN mkdir /srv/www
RUN echo "working" > /srv/www/nginx-container.html

ADD default /etc/nginx/sites-available/default
ADD nginx.conf /etc/nginx/nginx.conf
