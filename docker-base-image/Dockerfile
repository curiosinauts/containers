FROM debian:buster-slim

ENV username=debian

# bare minimum configuration
RUN DEBIAN_FRONTEND=noninteractive apt-get update --fix-missing && apt-get install -y --no-install-recommends tzdata
RUN apt-get update && apt-get install -y    \
    curl                                    \
    dumb-init                               \
    locales                                 \
    git                                     \
    zsh                                     \ 
  && rm -rf /var/lib/apt/lists/*

# set up user home, shell, ssh, etc.
ENV LANG=en_US.UTF-8
RUN sed -i "s/# en_US.UTF-8/en_US.UTF-8/" /etc/locale.gen && locale-gen                                         && \ 
    adduser --gecos '' --disabled-password ${username}                                                          && \
    chsh --shell /usr/bin/zsh ${username}                                                                       && \
    mkdir -p "/home/${username}/.zsh"                                                                           && \
    git clone https://github.com/sindresorhus/pure.git "/home/${username}/.zsh/pure"                            && \
    touch /home/${username}/.hushlogin                                                                          && \
    chown -R ${username}:${username} /home/${username}                                                          && \
    chsh --shell /usr/bin/zsh root                                                                              && \
    mkdir -p "/root/.zsh"                                                                                       && \
    git clone https://github.com/sindresorhus/pure.git "/root/.zsh/pure"                                        && \
    touch /root/.hushlogin 


COPY --chown=debian:debian .zshrc     /home/${username}/.zshrc
COPY --chown=root:root     .zshrc     /root/.zshrc

CMD [ "sleep", "10000000000000000000000" ]