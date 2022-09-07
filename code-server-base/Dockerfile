FROM curiosinauts/base:1.0.0

USER 1000
ENV USER=coder
WORKDIR /home/coder
USER coder

RUN chown -R coder:coder /home/coder

ENV CDR_VERSION=4.6.1
RUN curl -sfOL https://github.com/cdr/code-server/releases/download/v${CDR_VERSION}/code-server_${CDR_VERSION}_amd64.deb    && \
    sudo dpkg -i code-server_${CDR_VERSION}_amd64.deb                                                                       && \
    sudo systemctl enable code-server@$USER                                                                                 && \
    sudo rm code-server_${CDR_VERSION}_amd64.deb 