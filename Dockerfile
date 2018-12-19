FROM polinux/httpd-php

RUM yum install -y epel-release
RUN yum install -y php-mssql
# Copy site into place.
ADD app /var/www/html/

# Update the default apache site with the config we created.
#ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf

# By default, simply start apache.
#CMD /usr/sbin/apache2ctl -D FOREGROUND