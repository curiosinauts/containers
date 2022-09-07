# .zshrc

export PATH=$PATH:.:/usr/local/go/bin:~/bin:$HOME/go/bin:/home/coder/.local/bin

fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

[ -f ~/.exports ] && source ~/.exports