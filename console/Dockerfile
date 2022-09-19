FROM curiosinauts/docker-base-image:1.0.0

ARG CONSOLE_VERSION
ENV CONSOLE_VERSION ${CONSOLE_VERSION}


RUN set -x; curl -L https://github.com/curiosinauts/console/releases/download/v${CONSOLE_VERSION}/console_${CONSOLE_VERSION}_Linux_x86_64.tar.gz | tar -xvz -C /

COPY --chown=debian:debian  entrypoint.sh        /entrypoint.sh

RUN  chmod +x /entrypoint.sh             && \
     chmod +x /console              

EXPOSE 3000

USER 1000
ENV USER=debian
USER debian

CMD /entrypoint.sh