FROM debian:buster

ARG TZ='America/Sao_Paulo'
ENV TZ=${TZ}
RUN cp /usr/share/zoneinfo/${TZ} /etc/localtime

RUN apt update && apt upgrade -y && apt install -y \
    php                     \
    php-common              \
    php-cli                 \
    php-fpm                 \
    php-json                \ 
    php-pdo                 \ 
    php-mysql               \   
    php-zip                 \    
    php-gd                  \   
    php-mbstring            \   
    php-curl                \   
    php-xml                 \    
    php-pear                \     
    php-bcmath              \         
    php-intl                \
    php-imap                \
    php-ldap                \
    php-bz2                 \                   
    zip                     \ 
    libfreetype6-dev        \
    libjpeg62-turbo-dev     \
    libpng-dev              \ 
    libmcrypt-dev           \
    libicu-dev              \
    libxml2-dev             \
    libldb-dev              \
    libldap2-dev            \
    libxml2-dev             \
    libssl-dev              \
    libxslt-dev             \
    default-mysql-client    \
    libc-client-dev         \
    libkrb5-dev             \
    curl                    \
    libcurl4                \ 
    libsodium-dev           \
    git                     \
    vim                     \
    apache2                 \
    apache2-utils           \
    elinks                  \
    libapache2-mod-php      


