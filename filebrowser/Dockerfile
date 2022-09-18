FROM curiosinauts/docker-base-image:1.0.0

RUN  apt-get update && apt-get install -y    \
     nfs-common                              \
     sudo                                    \ 
   && rm -rf /var/lib/apt/lists/*

ENV  FILEBROWSER_VERSION=2.22.4
RUN  curl -sfL https://github.com/filebrowser/filebrowser/releases/download/v${FILEBROWSER_VERSION}/linux-amd64-filebrowser.tar.gz | tar -xz -C /usr/local/bin
RUN  echo "${username} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/nopasswd 

COPY entrypoint.sh /entrypoint.sh
RUN  chmod +x /entrypoint.sh

USER 1000
ENV USER=debian
WORKDIR /home/debian
USER debian

CMD  [ "/entrypoint.sh" ]

