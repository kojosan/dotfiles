case "${OSTYPE}" in
darwin*)
    [ -f ~/dotfiles/zshenv_osx ] && source ~/dotfiles/zshenv_osx
    ;;
linux*)
    [ -f ~/dotfiles/zshrc_linux ] && source ~/dotfiles/zshenv_linux
    ;;
esac

[ -f ~/.zshenv_local ] && source ~/.zshenv_local

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
