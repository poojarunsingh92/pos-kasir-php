FROM ubuntu:20.04
ENV DEBIAN_FRONTEND noninteractive

RUN apt update && apt install -y tcl
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y zip unzip
RUN apt-get install apache2 -y
RUN apt install php libapache2-mod-php php-mysql -y
WORKDIR /var/www/html/
COPY . .
RUN chown -R www-data:www-data /var/www/html
RUN mv index.html /tmp
RUN echo 'ServerName 127.0.0.1' >> /etc/apache2/apache2.conf
EXPOSE 80
EXPOSE 3306
CMD ["apachectl", "-D", "FOREGROUND"]

