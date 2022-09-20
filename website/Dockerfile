FROM debian:10 

RUN apt-get update && apt-get install -y nginx                                 

COPY entrypoint.sh /
COPY sites-available /etc/nginx/sites-available

RUN  set -x                                                      && \
     chmod +x /entrypoint.sh                                     && \
     mkdir -p /var/www/www.curiosityworks.org/htdocs             && \
     chown -R root:root /var/www                                 && \
     ln -s /etc/nginx/sites-available/www.curiosityworks.org        \
           /etc/nginx/sites-enabled/www.curiosityworks.org  

EXPOSE 80

CMD ["/entrypoint.sh"]