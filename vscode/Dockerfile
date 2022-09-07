FROM debian:10 AS base

ENV username=coder

RUN DEBIAN_FRONTEND=noninteractive apt-get update --fix-missing && apt-get install -y --no-install-recommends tzdata
RUN apt-get update && apt-get install -y    \
    curl                                    \
    dumb-init                               \
    git                                     \
    htop                                    \
    locales                                 \
    lsb-release                             \
    man                                     \
    nano                                    \
    openssh-client                          \
    openssh-server                          \
    procps                                  \
    sudo                                    \
    vim.tiny                                \
    zsh                                     \
  && rm -rf /var/lib/apt/lists/*

ENV LANG=en_US.UTF-8
RUN sed -i "s/# en_US.UTF-8/en_US.UTF-8/" /etc/locale.gen && locale-gen                                         && \ 
    adduser --gecos '' --disabled-password ${username}                                                          && \
    echo "${username} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/nopasswd                                        && \
    chsh --shell /usr/bin/zsh ${username}                                                                       && \
    mkdir -p "/home/${username}/.zsh"                                                                           && \
    git clone https://github.com/sindresorhus/pure.git "/home/${username}/.zsh/pure"                            && \
    touch /home/${username}/.hushlogin                                                                          && \
    chown -R ${username}:${username} /home/${username}                                                          && \
    sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/' /etc/ssh/sshd_config

COPY --chown=coder:coder .zshrc     /home/${username}/.zshrc


# --------------------------------------------------------------------------------------
FROM base AS language

RUN apt-get update --fix-missing  &&    \
    apt-get -q -y  install              \
    python3                             \
    python3-pip                         \
  && rm -rf /var/lib/apt/lists/*

ENV GO_VERSION 1.17.6
RUN curl -s -O https://dl.google.com/go/go"${GO_VERSION}".linux-amd64.tar.gz    && \
    tar -xf go"${GO_VERSION}".linux-amd64.tar.gz -C /usr/local                  && \
    rm go"${GO_VERSION}".linux-amd64.tar.gz                                     


# --------------------------------------------------------------------------------------
FROM language AS tools

RUN apt-get update --fix-missing  &&    \
    apt-get -q -y  install              \
    `# misc                      `      \
    jq                                  \
    uuid                                \
    zip                                 \
    `# python db dependencies.   `      \
    openssl                             \
    postgresql                          \
    libpq-dev                           \
  && rm -rf /var/lib/apt/lists/*

# Install tools
RUN sudo pip3 install "pip>=20" 

# --------------------------------------------------------------------------------------
FROM tools AS coder-base

USER 1000
ENV USER=coder
WORKDIR /home/coder
USER coder

RUN chown -R coder:coder /home/coder

ENV CDR_VERSION=4.0.2
RUN curl -sfOL https://github.com/cdr/code-server/releases/download/v${CDR_VERSION}/code-server_${CDR_VERSION}_amd64.deb    && \
    sudo dpkg -i code-server_${CDR_VERSION}_amd64.deb                                                                       && \
    sudo systemctl enable code-server@$USER                                                                                 && \
    sudo rm code-server_${CDR_VERSION}_amd64.deb 


# vscode extention go tools prior to installing vscode go extention 
RUN export PATH=$PATH:.:/usr/local/go/bin/                  && \
    sudo mkdir -p /home/coder/go                            && \
    sudo chown coder:coder /home/coder/go                   && \
    go get -v golang.org/x/tools/gopls                      && \
    go get -v github.com/uudashr/gopkgs/v2/cmd/gopkgs       && \
    go get -v github.com/cweill/gotests/gotests             && \
    go get -v github.com/fatih/gomodifytags                 && \
    go get -v github.com/josharian/impl                     && \
    go get -v github.com/haya14busa/goplay/cmd/goplay       && \
    go get -v github.com/go-delve/delve/cmd/dlv             && \
    go get -v honnef.co/go/tools/cmd/staticcheck            && \
    go get -v github.com/ramya-rao-a/go-outline             && \
    `# project specific libraries `                         && \
    go get -v github.com/markbates/refresh                  && \
    go get -v github.com/mitchellh/gox                      && \
    go get -v github.com/go-swagger/go-swagger              && \
    `# terminal app `                                       && \
    go get -v github.com/sorenisanerd/gotty

# vscode extention
#   /usr/bin/code-server --install-extension jpotterm.simple-vim    && \
RUN /usr/bin/code-server --install-extension ms-python.python       && \               
    /usr/bin/code-server --install-extension golang.go              && \
    /usr/bin/code-server --install-extension vsls-contrib.codetour  && \
    /usr/bin/python3 -m pip install -U pylint --user
