#  ------------------------------
#  ENVIRONMENT CONFIG
#  ------------------------------

# Enabling and setting git info var to be used in prompt config.
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
# This line obtains information from the vcs.
zstyle ':vcs_info:git*' formats "- (%b) "
precmd() {
    vcs_info
}

# Enable substitution in the prompt.
setopt prompt_subst

# Config for the prompt. PS1 synonym.
prompt='%2/ ${vcs_info_msg_0_}> '


# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

#  Set Default Editor
export EDITOR="/opt/homebrew/bin/nvim"

#  Add colors to terminal
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

#  ------------------------------
#  MAKE TERMINAL BETTER
#  ------------------------------
# shortcut commonly used CLIs 
alias dc="docker-compose"
alias k="kubectl"
alias v="nvim"
alias t="tmux" 

# Preferred implementation of common commands 
alias cp="cp -iv"
alias mv="mv -iv"
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation

# Aliias cmmonly used commands 
alias ~="cd ~"
alias dka='docker container kill $(docker ps -q)'
alias tarball="tar -zcvf"                   # Preferred 'tar' implementation
alias vrc="vim ~/.vimrc"
alias zrc="vim ~/.zshrc"
 


#  ------------------------------
#  EXTERNAL TOOL CONFIGURATION  
#  ------------------------------

# PipX configuration 
# Set default pipx default python
# https://gabnotes.org/how-use-pipx-pyenv/
export PIPX_DEFAULT_PYTHON="$HOME/.pyenv/versions/3.9.16/bin/python"
export PATH="~/.local/bin:$PATH"

# Pyenv configuration  
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)" # This only sets up the path stuff.
eval "$(pyenv init -)" # This makes pyenv work in the shell.
eval "$(pyenv virtualenv-init -)" # Enabling virtualenv so it works natively.

# Rust configuration 
. "$HOME/.cargo/env"

# Google Cloud configuration 
# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/Downloads/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/Downloads/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc"; fi


# RipGrep configuration 
# from https://github.com/iggredible/Learn-Vim/blob/master/ch03_searching_files.md#setup
if type rg &> /dev/null; then 
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPS='-m'
fi


# Docker configuration 
if [ -f "$HOME/.docker/init-zsh.sh" ]; then
    source $HOME/.docker/init-zsh.sh || true; # Added by Docker Desktop
fi


# Load other configuraton files
if [ -f "$HOME/.work.zshrc" ]; then source "$HOME/.work.zshrc"; fi
