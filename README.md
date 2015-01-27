# Mike Schmidt's Dot Files

To install dotfiles, cd into the repo root and run `stow` on the directory you wish to install.
For example:
```bash
stow vim
```

## VIM
For __vim__, run the following to install and build the plugins.

`vim +PluginInstall +qall`

`(cd .vim/bundle/YouCompleteMe/; ./install.sh --clang-completer --system-libclang --system-boost)`
