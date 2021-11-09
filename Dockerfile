FROM debian:buster

ARG TZ='America/Sao_Paulo'
ENV TZ=${TZ}
ENV VER="9.4.5"
RUN cp /usr/share/zoneinfo/${TZ} /etc/localtime

RUN apt update && apt upgrade -y && apt install -y \
php \
php-common \
php-cli \
php-fpm \
php-json \ 
php-pdo \ 
php-mysql \   
php-zip \    
php-gd \   
php-mbstring \   
php-curl \   
php-xml \    
php-pear \     
php-bcmath \         
php-intl \
php-imap \
php-ldap \
php-bz2 \                   
zip \ 
libfreetype6-dev \
libjpeg62-turbo-dev \
libpng-dev \ 
libmcrypt-dev \
libicu-dev \
libxml2-dev \
libldb-dev \
libldap2-dev \
libxml2-dev \
libssl-dev \
libxslt-dev \
default-mysql-client \
libc-client-dev \
libkrb5-dev \
libcurl4 \ 
libsodium-dev \
git \
vim \
wget \
curl \
apache2 \
apache2-utils \
libapache2-mod-php      
WORKDIR [ "/var/www/html" ] 
RUN wget https://github.com/glpi-project/glpi/releases/download/$VER/glpi-$VER.tgz
RUN tar xvf glpi-$VER.tgz 
RUN chown -R www-data:www-data /var/www/html/

