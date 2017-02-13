FROM library/debian
MAINTAINER Enric <emieza@xtec.cat>
RUN echo "nameserver 10.27.100.1">/etc/resolv.conf && \
apt-get update && \
apt-get install -y apache2 && \
apt-get clean && apt-get autoclean
ADD index.html /var/www/html/index.html
RUN /etc/init.d/apache2 start
EXPOSE 80
CMD /usr/sbin/apache2ctl -D FOREGROUND
