FROM curiosinauts/code-server-base:1.0.0

USER root
ENV  USER root
ENV  GO_VERSION 1.19.1
RUN  curl -s -O https://dl.google.com/go/go"${GO_VERSION}".linux-amd64.tar.gz    && \
     tar -xf go"${GO_VERSION}".linux-amd64.tar.gz -C /usr/local                  && \
     rm go"${GO_VERSION}".linux-amd64.tar.gz    


# vscode extention go tools prior to installing vscode go extention 
USER coder
ENV  USER coder
RUN  export PATH=$PATH:.:/usr/local/go/bin/                           && \
     sudo mkdir -p /home/coder/go                                     && \
     sudo chown coder:coder /home/coder/go                            && \
     go install golang.org/x/tools/gopls@latest                       && \
     go install github.com/uudashr/gopkgs/v2/cmd/gopkgs@latest        && \
     go install github.com/cweill/gotests/gotests@latest              && \
     go install github.com/fatih/gomodifytags@latest                  && \
     go install github.com/josharian/impl@latest                      && \
     go install github.com/haya14busa/goplay/cmd/goplay@latest        && \
     go install github.com/go-delve/delve/cmd/dlv@latest              && \
     go install honnef.co/go/tools/cmd/staticcheck@latest             && \
     go install github.com/ramya-rao-a/go-outline@latest              && \
     `# project specific libraries `                                  && \
     go install github.com/markbates/refresh@latest                   && \
     go install github.com/mitchellh/gox@latest                       && \
     `# terminal app `                                                && \
     go install github.com/sorenisanerd/gotty@latest


# vscode extentions
RUN  /usr/bin/code-server --install-extension vscodevim.vim           && \
     /usr/bin/code-server --install-extension golang.go               && \
     /usr/bin/code-server --install-extension vsls-contrib.codetour 

RUN  mkdir -p /home/coder/workspace                                   && \
     mkdir -p /home/coder/.local/bin                                  && \
     chown -R coder:coder /home/coder/workspace        

COPY --chown=coder:coder .zshrc         /home/coder/.zshrc
COPY --chown=coder:coder settings.json  /home/coder/.local/share/code-server/User/settings.json
COPY --chown=coder:coder entrypoint.sh  /home/coder/.local/bin/entrypoint.sh
RUN  chmod +x /home/coder/.local/bin/entrypoint.sh

EXPOSE 9991
EXPOSE 22

ENTRYPOINT ["/home/coder/.local/bin/entrypoint.sh"]