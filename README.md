# Mike Schmidt's Dot Files

## Software
I use the following software in my setup:

* [i3-gaps](https://github.com/Airblader/i3)
* [Polybar](https://github.com/jaagr/polybar)
* dmenu
* dunst
* compton
* tmux
* vim 8
* [st](https://st.suckless.org/)
* [NerdFonts](https://st.suckless.org/) (FuraMono)

## Install
To install all components run:
```bash
cd $HOME
git clone https://github.com/schmidmt/dotfiles.git
cd dotfiles
# Only run those you wish to install
xstow bash
xstow compton
xstow dunst
xstow fish
xstow git
xstow i3
xstow ipython
xstow polybar
xstow tmux
xstow vim
```
