# .zshrc

export PATH=$PATH:.:~/bin::/home/coder/.local/bin:~/.poetry/bin

fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

[ -f ~/.exports ] && source ~/.exports

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"