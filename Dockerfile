FROM polinux/httpd-php

RUN yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN yum install yum-utils
RUN yum-config-manager --enable remi-php70   [Install PHP 7.0]
RUN yum-config-manager --enable remi-php72   [Install PHP 7.2]
RUN yum install php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo

# Copy site into place.
ADD app /var/www/html/

# Update the default apache site with the config we created.
#ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf

# By default, simply start apache.
#CMD /usr/sbin/apache2ctl -D FOREGROUND