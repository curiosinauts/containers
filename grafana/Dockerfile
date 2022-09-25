FROM curiosinauts/docker-base-image:1.0.0


ENV  GRAFANA_VERSION=9.1.6
RUN  mkdir -p /opt/grafana                                                                                                                          && \ 
     curl -sfL https://dl.grafana.com/oss/release/grafana-${GRAFANA_VERSION}.linux-amd64.tar.gz | tar -xz --strip-components=1 -C /opt/grafana  
COPY defaults.ini /opt/grafana/conf/defaults.ini
RUN  chown -R debian:debian /opt/grafana


COPY entrypoint.sh /entrypoint.sh
RUN  chmod +x /entrypoint.sh


USER 1000
ENV USER=debian
WORKDIR /opt/grafana
USER debian


CMD  [ "/entrypoint.sh" ]