FROM debian:10 AS base

ENV username=coder

# bare minimum configuration
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

# set up user home, shell, ssh, etc.
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

# tools
RUN apt-get update --fix-missing  &&        \
    apt-get -q -y  install                  \
    `# misc                      `          \
    jq                                      \
    uuid                                    \
    zip                                     \
    `# python db dependencies.   `          \
    openssl                                 \
    postgresql                              \
    libpq-dev                               \
  && rm -rf /var/lib/apt/lists/*

