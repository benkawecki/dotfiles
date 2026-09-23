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

#  History configuration
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# Config for the prompt. PS1 synonym.
prompt='%2/ ${vcs_info_msg_0_}> '


# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

#  Set Default Editor
export EDITOR="/opt/homebrew/bin/nvim"

# Add user-installed binaries to PATH.
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

# Follow the XDG base directory convention.
export XDG_CONFIG_HOME="$HOME/.config"

# Use the current terminal for GPG signing when one is available.
if [[ -t 0 ]]; then
  export GPG_TTY="$(tty)"
fi

#  Add colors to terminal
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

#  ------------------------------
#  MAKE TERMINAL BETTER
#  ------------------------------
# shortcut commonly used CLIs 
alias dc="docker compose"
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
alias vrc="nvim ~/.vimrc"
alias zrc="nvim ~/.zshrc"
alias dot="nvim ~/dotfiles"

# Use vi-style shell editing while keeping backspace behavior consistent.
bindkey -v
bindkey "^H" backward-delete-char
bindkey "^?" backward-delete-char

# fzf history search (current terminal)
fh() {
  local out key cmd
  out=$(fc -l 1 | fzf --tac --no-sort --expect=ctrl-e) || return
  key=$(head -1 <<< "$out")
  cmd=$(tail -1 <<< "$out")
  [[ -z "$cmd" ]] && return
  cmd="${cmd#*[0-9]  }"
  if [[ "$key" == "ctrl-e" ]]; then
    local tmpfile=$(mktemp)
    echo "$cmd" > "$tmpfile"
    $EDITOR "$tmpfile"
    local edited=$(cat "$tmpfile")
    rm "$tmpfile"
    [[ -n "$edited" ]] && print -z "$edited"
  else
    print -z "$cmd"
  fi
}

# fzf history search (all terminals)
fha() {
  local out key cmd
  out=$(cat ~/.zsh_history | fzf --tac --no-sort --expect=ctrl-e) || return
  key=$(head -1 <<< "$out")
  cmd=$(tail -1 <<< "$out")
  [[ -z "$cmd" ]] && return
  if [[ "$key" == "ctrl-e" ]]; then
    local tmpfile=$(mktemp)
    echo "$cmd" > "$tmpfile"
    $EDITOR "$tmpfile"
    local edited=$(cat "$tmpfile")
    rm "$tmpfile"
    [[ -n "$edited" ]] && print -z "$edited"
  else
    print -z "$cmd"
  fi
}
 


#  ------------------------------
#  EXTERNAL TOOL CONFIGURATION  
#  ------------------------------

# PipX configuration 
# Set default pipx default python
# https://gabnotes.org/how-use-pipx-pyenv/
export PIPX_DEFAULT_PYTHON="$HOME/.pyenv/versions/3.9.16/bin/python"

# Pyenv configuration  
export PYENV_ROOT="$HOME/.pyenv"
if [[ -d "$PYENV_ROOT/bin" ]]; then
  export PATH="$PYENV_ROOT/bin:$PATH"
fi
if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init --path)" # This only sets up the path stuff.
  eval "$(pyenv init -)" # This makes pyenv work in the shell.
  if pyenv commands | command grep -qx 'virtualenv-init'; then
    eval "$(pyenv virtualenv-init -)" # Enable pyenv-virtualenv when installed.
  fi
fi

# Rust configuration 
if [[ -f "$HOME/.cargo/env" ]]; then
  source "$HOME/.cargo/env"
fi

# Google Cloud configuration 
# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/Downloads/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/Downloads/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc"; fi


# RipGrep configuration 
# from https://github.com/iggredible/Learn-Vim/blob/master/ch03_searching_files.md#setup
if command -v rg >/dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m'
fi

# Enable history substring search when installed by Homebrew.
if command -v brew >/dev/null 2>&1; then
  history_search_file="$(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
  if [[ -f "$history_search_file" ]]; then
    source "$history_search_file"
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
  fi
  unset history_search_file
fi


# Docker configuration 
if [ -f "$HOME/.docker/init-zsh.sh" ]; then
  source "$HOME/.docker/init-zsh.sh" || true # Added by Docker Desktop
fi


# Load optional local configuration files.
if [[ -f "$HOME/.work.zshrc" ]]; then
  source "$HOME/.work.zshrc"
fi
if [[ -f "$HOME/.lcldevrc" ]]; then
  source "$HOME/.lcldevrc"
fi

# SDKMAN must be initialized at the end of the file.
export SDKMAN_DIR="$HOME/.sdkman"
if [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]]; then
  source "$SDKMAN_DIR/bin/sdkman-init.sh"
fi
