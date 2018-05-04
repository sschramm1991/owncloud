From owncloud:10

COPY default-ssl.conf /etc/apache2/sites-available/default-ssl.conf

RUN a2enmod ssl
RUN a2ensite default-ssl.conf
#RUN apt-get install -y libapache2-mod-php5.6

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
