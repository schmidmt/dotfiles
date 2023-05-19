fish_add_path /usr/local/bin/
fish_add_path /usr/local/sbin
fish_add_path /Users/schmidmt/Library/Python/3.10/bin

# Add LLVM to path
fish_add_path /usr/local/opt/llvm/bin

# Add rancherdesktop tools
fish_add_path ~/.rd/bin

# Add local bin to path
fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.fzf/bin

# Use util-linux commands
fish_add_path /usr/local/opt/util-linux/bin
fish_add_path /usr/local/opt/util-linux/sbin


# Start keychain for SSH and GPG
if status --is-interactive
    keychain --agents gpg,ssh --quiet ~/.ssh/id_ed25519
end

begin
    set -l HOSTNAME (hostname)
    if test -f ~/.keychain/$HOSTNAME-fish
        source ~/.keychain/$HOSTNAME-fish
    end
    set -gx PATH $HOME/.cargo/bin $PATH
end


# Set some helpful aliaes
alias python=python3
alias pip="python3 -m pip"
alias vim=nvim
alias cat=bat
alias ls=exa
alias find=fd
alias ps=procs

# Setup the fuck
eval (thefuck --alias | tr '\n' ';')

set -gx EXPORT (which nvim)

# Set texmf path
set -x TEXMFHOME "~/texmf"

# Start Starship
starship init fish | source

source ~/.iterm2_shell_integration.(basename $SHELL)

# Setup minikube's docker connection
#eval (timeout 3s minikube docker-env)
set -gx DOCKER_BUILDKIT 1
set -gx COMPOSE_DOCKER_CLI_BUILD 1

# Sccache Settings
#set -gx RUSTC_WRAPPER /Users/schmidmt/.cargo/bin/sccache

# Set fzf bindings
fzf_configure_bindings --directory=\cf

# Setup pyenv
pyenv init - | source


### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/schmidmt/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
