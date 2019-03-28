From owncloud:10.0.10
Maintainer Steven Schramm <steven.schramm91@googlemail.com>

COPY default-ssl.conf /etc/apache2/sites-available/default-ssl.conf

RUN a2enmod ssl
RUN a2enmod headers
RUN a2ensite default-ssl.conf
#RUN apt-get install -y libapache2-mod-php7.1

#CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
