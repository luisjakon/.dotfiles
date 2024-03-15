### ZSH HOME
export ZSH=$HOME/.zsh

### Source other configs
[[ -f $ZSH/config/completions.zsh ]] && source $ZSH/config/completions.zsh
[[ -f $ZSH/config/history.zsh ]] && source $ZSH/config/history.zsh
[[ -f $ZSH/config/aliases.zsh ]] && source $ZSH/config/aliases.zsh

### Source plugins
[[ -f $ZSH/plugins/plugins.zsh ]] && source $ZSH/plugins/plugins.zsh

### Volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

### Pnpm
export PNPM_HOME="/Users/luis/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

### Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

### Goenv
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

### Rustup
source $HOME/.cargo/env

### Aliases
alias npm=pnpm
alias tidy=/usr/local/bin/tidy

### Path
export PATH=$HOME/bin:/usr/local/bin:$PATH

### Path clean up
typeset -U path

### Editor
export NVIM_APPNAME="nvim-astronvim"
export EDITOR="nvim"
# export VISUAL="$EDITOR"

### Starship
eval "$(starship init zsh)"
