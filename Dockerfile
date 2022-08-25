FROM debian:buster

WORKDIR /app

# Get our tools
RUN apt-get update && apt-get install -y\
	nginx\
	openssl\
	mariadb-server\
	php7.3\
	php7.3-cli\
	php7.3-fpm\
	php7.3-mysql\
	php7.3-json\
	php7.3-opcache\
	php7.3-mbstring\
	php7.3-xml\
	php7.3-gd\
	php7.3-curl

# Vim for testing
RUN apt-get install -y vim

COPY srcs .

RUN bash /app/temp/setup.sh

EXPOSE 80 443

CMD ["bash", "/app/services.sh"]
