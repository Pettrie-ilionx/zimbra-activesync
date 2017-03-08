FROM httpd:2.4
MAINTAINER Pettrie de Bondt <info@tryfirst.nl>

ENV VERSION 2.3
ENV VERSIONFULL 2.3.5
ENV TERM xterm

ENV ZPUSH_URL zpush_default
ENV ZIMBRA_HOST localhost

RUN whoami

RUN apt-get update
RUN apt-get --assume-yes install wget

RUN mkdir -p /home/www/public/backend/zimbra
RUN cd /home/www/public/backend/zimbra

RUN cd /home/www/public && \
	wget -O - "http://download.z-push.org/final/${VERSION}/z-push-${VERSIONFULL}.tar.gz" | tar --strip-components=1 -x -z

#RUN mkdir /home/www/public/backend 
#RUN chmod -R 777 /home/www/public/backend
WORKDIR /tmp
RUN	wget -O - "http://downloads.sourceforge.net/project/zimbrabackend/Release66/zimbra66.tgz?use_mirror=freefr" | tar --strip-components=1 -x -z
RUN	mv /tmp/*.php /home/www/public/backend/zimbra

RUN mkdir -p /home/logs/z-push
RUN mkdir -p /var/lib/z-push
RUN chmod -R 777 /home/logs
RUN chmod -R 777 /var/lib/z-push

COPY autodiscover/ /home/www/public/autodiscover/
COPY config.php /home/www/public/config.php
COPY default.vhost /etc/apache2/sites-enabled/000-default

RUN sed -i "s/#ZPUSH_HOST#/$ZPUSH_URL/" /home/www/public/config.php
RUN sed -i "s/#ZIMBRA_HOST#/$ZIMBRA_HOST/" /home/www/public/config.php

COPY ./startup.sh /root/startup.sh
CMD ["/bin/bash", "/root/startup.sh"]
