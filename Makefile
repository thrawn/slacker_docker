
.PHONY: all
all :
	cd nginx; docker build -t thrawn/nginx:1.8 .
	cd ..
	cd php5; docker build -t thrawn/php5:5.5 .
	cd ..
	cd web; docker build -t thrawn/web:2.0 .
	bash deploy.sh
	

