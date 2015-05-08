# Mike Schmidt's Dot Files

To install dotfiles, cd into the repo root and run `stow` on the directory you wish to install.
For example:
```bash
stow vim
```

## VIM
For __vim__, run the following to install and build the plugins.
Install the plugin manager:
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

`vim +PlugInstall +qall`

`(cd .vim/bundle/YouCompleteMe/; ./install.sh --clang-completer)`
