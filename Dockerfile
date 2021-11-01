From nextcloud:21.0.0
Maintainer Steven Schramm <steven.schramm91@googlemail.com>

COPY default-ssl.conf /etc/apache2/sites-available/default-ssl.conf

#RUN apt-get update -y && apt-get install libapache2-mod-geoip -y && a2enmod geoip 
RUN a2enmod ssl
RUN a2enmod headers
RUN a2ensite default-ssl.conf
#RUN apt-get install -y libapache2-mod-php7.1

#CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
