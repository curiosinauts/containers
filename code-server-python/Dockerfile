FROM curiosinauts/code-server-base:1.0.0

ENV username=coder

# ensure local python is preferred over distribution python
ENV PATH /usr/local/bin:$PATH

# https://github.com/pyenv/pyenv/wiki#suggested-build-environment
RUN  sudo apt-get update && sudo apt-get install -y                      \
     make                                                                \
     build-essential                                                     \
     libssl-dev                                                          \
     zlib1g-dev                                                          \
     libbz2-dev                                                          \
     libreadline-dev                                                     \
     libsqlite3-dev                                                      \
     wget                                                                \
     curl                                                                \
     llvm                                                                \
     libncursesw5-dev                                                    \
     xz-utils                                                            \
     tk-dev                                                              \
     libxml2-dev                                                         \
     libxmlsec1-dev                                                      \
     libffi-dev                                                          \
     liblzma-dev                                                      && \
     curl https://pyenv.run | bash
 
RUN  export PATH="$HOME/.pyenv/bin:$PATH"                             && \
     pyenv install 3.8.10                                             && \
     pyenv global 3.8.10 


# ----------------------------------------------------------------------------------------
RUN  /usr/bin/code-server --install-extension ms-python.python        && \
     /usr/bin/code-server --install-extension vsls-contrib.codetour   && \
     /home/coder/.pyenv/shims/python3 -m pip install -U pylint --user && \
     /home/coder/.pyenv/shims/python3 -m pip install --upgrade pip

RUN  mkdir -p /home/coder/workspace                                   && \
     mkdir -p /home/coder/.local/bin                                  && \
     chown -R coder:coder /home/coder/workspace        

COPY --chown=coder:coder .zshrc     /home/coder/.zshrc
COPY --chown=coder:coder settings.json  /home/coder/.local/share/code-server/User/settings.json
COPY --chown=coder:coder entrypoint.sh  /home/coder/.local/bin/entrypoint.sh
RUN  chmod +x /home/coder/.local/bin/entrypoint.sh

EXPOSE 9991
EXPOSE 22

ENTRYPOINT ["/home/coder/.local/bin/entrypoint.sh"]