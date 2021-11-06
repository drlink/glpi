FROM php:7.4-fpm
ARG TZ='America/Sao_Paulo'
ENV TZ=${TZ}
ENV EXT_APCU_VERSION=5.1.17
RUN cp /usr/share/zoneinfo/${TZ} /etc/localtime

RUN apt-get update && apt-get upgrade -y 

RUN apt-get install -y \
    apt-utils               \
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
    postgresql-client       \
    default-mysql-client    \
    libsqlite3-dev          \
    libsqlite3-0            \
    libc-client-dev         \
    libkrb5-dev             \
    curl                    \
    libcurl4                \ 
    libsodium-dev           

RUN apt install -y        \
    libfreetype6-dev      \ 
    libjpeg62-turbo-dev   \ 
    libpng16-16           \ 
    libpspell-dev         \
    aspell-en             \
    aspell-de             \ 
    libtidy-dev           \
    libsnmp-dev           \  
    librecode0            \         
    librecode-dev         \
    libzip-dev            \
    libzip4                \
    ziptool               \ 
    libicu-dev            \
    icu-devtools          \
    libicu67                     

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer 
RUN docker-php-ext-configure gd --with-freetype --with-jpeg 
RUN docker-php-ext-install -j$(nproc) gd
RUN docker-php-ext-install -j$(nproc) intl 
RUN docker-php-ext-install intl
RUN docker-php-ext-install mysqli     
RUN docker-php-ext-install exif           
RUN docker-php-ext-install zip          
RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl && \
docker-php-ext-install imap
RUN docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu && \
docker-php-ext-install ldap

# ext-apcu
RUN mkdir -p /usr/src/php/ext/apcu 
RUN curl -fsSL https://github.com/krakjoe/apcu/archive/v$EXT_APCU_VERSION.tar.gz | tar xvz -C /usr/src/php/ext/apcu --strip 1 
RUN docker-php-ext-install apcu  
RUN docker-php-ext-install bcmath sockets 
# cleanup
RUN docker-php-source delete

RUN echo '\
opcache.interned_strings_buffer=16\n\
opcache.load_comments=Off\n\
opcache.max_accelerated_files=16000\n\
opcache.save_comments=Off\n\
' >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini




#ENTRYPOINT [ "php-fpm" ]