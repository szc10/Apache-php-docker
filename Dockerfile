FROM ubuntu:16.04
MAINTAINER <Lemon shi : sh081042@gmail.com>
ADD sources.list /etc/apt/sources.list
# Installs necesseary packages
RUN apt-get update && \
    apt-get -y install \
        apache2 && \
    apt-get -y install \
        php7.0 \
        libapache2-mod-php7.0 --fix-missing && \
    apt-get -y install \
        php7.0-curl \
        php7.0-dev \
        php7.0-gd \
        php7.0-json \
        php7.0-mysql \
        php7.0-zip \
	php7.0-xml \
        php7.0-mbstring \
        php7.0-mcrypt --fix-missing && \
    apt-get -y install \
        php-pear \
        php-apcu --fix-missing && \
    apt-get -y install \
        libcurl4-openssl-dev \
        pkg-config \
        libssl-dev \
        libsslcommon2-dev  && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Installs and Enables PHP MongoDB driver
RUN pecl install mongodb && \
    /bin/bash -c "echo extension=mongodb.so >> /etc/php/7.0/apache2/php.ini"

# Installs and Enables PHP redis driver
RUN pecl install redis && \
    /bin/bash -c "echo extenion=redis.so >> /etc/php/7.0/apache2/php.ini"    

# Set Apache Environment variables
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

# Copy modified apache2.conf into the configuration folder
ADD apache2.conf /etc/apache2/apache2.conf

# Enables Webpages
RUN /usr/sbin/a2ensite default-ssl && /usr/sbin/a2enmod ssl && /usr/sbin/a2enmod rewrite

# Listen to connections on 80 and 443
EXPOSE 80
EXPOSE 443

# Start Apache
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
