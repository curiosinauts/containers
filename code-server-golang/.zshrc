# .zshrc

export PATH=$PATH:.:~/bin::/home/coder/.local/bin:/usr/local/go/bin

fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

[ -f ~/.exports ] && source ~/.exports