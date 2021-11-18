# Load new functions
fpath+=~/.zfunc

# Configure the minimal prompt
MNML_PROMPT=(mnml_ssh mnml_pyenv mnml_status)
MNML_RPROMPT=('mnml_cwd 2 20' mnml_git)
MNML_MAGICENTER=(mnml_me_dirs mnml_me_git)
MNML_MAGICENTER=
MNML_INFOLN=
MNML_USER_CHAR=$
MNML_ELLIPSIS_CHAR="…"

source "${HOME}/Projects/FLOSS/minimal/minimal.zsh"

# Optionally extend the PATH environment variable.
# Note the order of preference is reversed (LIFO).
function path_prepend {
  if [ -d "$1" ]; then
    PATH="$1:${PATH}"
  fi
}
function path_append {
  if [ -d "$1" ]; then
    PATH="${PATH}:$1"
  fi
}
path_append "/snap/bin"  # Snaps
path_append "$HOME/Android/Sdk/platform-tools"  # Android tools
path_prepend "$HOME/.cargo/bin"  # local Rust binaries
path_prepend "$HOME/.local/bin"  # local Python (pipx) binaries
path_prepend "$HOME/bin"  # local scripts
export PATH=$(zsh -fc "typeset -TU P=$PATH p; echo \$P")  # dedupe elements
unset -f path_append
unset -f path_prepend

# Configure the Z shell history
HISTFILE=~/.zsh_history
HISTSIZE=5000   # In-memory history
SAVEHIST=1000   # On-disk history
setopt append_history   # Append history to the history file
unsetopt share_history  # Do not read history of other shell

# Use emacs-style key binding
bindkey -e
bindkey "^[[1;5D" backward-word  # CTRL + left arrow
bindkey "^[[1;5C" forward-word  # CTRL + right arrow

# Configure the auto-completion features
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' max-errors 3
HYPHEN_INSENSITIVE="true"

# Set up colour support
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'

  zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
fi

# Set up aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Load pyenv
export PYENV_ROOT="${HOME}/.local/pyenv"
export PATH="${PYENV_ROOT}/bin:${PATH}"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Load zsh-nvm
export NVM_LAZY_LOAD=true
source ~/Projects/FLOSS/lukechilds/zsh-nvm/zsh-nvm.plugin.zsh

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' max-errors 3
zstyle :compinstall filename '/home/borjan/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source /etc/zsh_command_not_found
