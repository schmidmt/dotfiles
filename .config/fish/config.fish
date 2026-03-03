
# Add local bin to path
fish_add_path -m ~/.local/bin
fish_add_path /usr/local/bin/
fish_add_path /usr/local/sbin

# Add LLVM to path
fish_add_path /usr/local/opt/llvm/bin

# Add rancherdesktop tools
fish_add_path ~/.rd/bin

# Set some helpful aliaes
alias vim=nvim
alias cat=bat
alias ls=eza
alias find=fd

set -gx EXPORT (which nvim)

# Setup rust up
fish_add_path (/opt/homebrew/bin/brew --prefix rustup)/bin

# Set up homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add local bin to path
fish_add_path -p ~/.local/share/bob/nvim-bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.fzf/bin

# Set texmf path
set -x TEXMFHOME "~/texmf"


# Setup minikube's docker connection
#eval (timeout 3s minikube docker-env)
set -gx DOCKER_BUILDKIT 1
set -gx COMPOSE_DOCKER_CLI_BUILD 1
set -gx EDITOR nvim

# Start keychain for SSH and GPG
if status --is-interactive
    keychain --quiet ~/.ssh/id_ed25519

    # Set fzf bindings
    fzf_configure_bindings --directory=\cf

    # Start Starship
    starship init fish | source
end

begin
    set -l HOSTNAME (hostname)
    if test -f ~/.keychain/$HOSTNAME-fish
        source ~/.keychain/$HOSTNAME-fish
    end
    set -gx PATH $HOME/.cargo/bin $PATH
end
