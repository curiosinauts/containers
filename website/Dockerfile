FROM curiosinauts/docker-base-image:1.0.0 

RUN apt-get update && apt-get install -y nginx                                 

COPY entrypoint.sh /
COPY sites-available /etc/nginx/sites-available

RUN  set -x                                                      && \
     chmod +x /entrypoint.sh                                     && \
     mkdir -p /mnt/data/www                                      && \
     chown -R root:root /mnt/data/www                            && \
     ln -s /etc/nginx/sites-available/www.curiosityworks.org        \
           /etc/nginx/sites-enabled/www.curiosityworks.org  

EXPOSE 80

CMD ["/entrypoint.sh"]