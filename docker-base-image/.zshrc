# .zshrc

export PATH=$PATH:.:~/bin:~/.local/bin

fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

[ -f ~/.exports ] && source ~/.exports