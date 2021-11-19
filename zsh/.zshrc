# Load new functions
fpath+=~/.zfunc

# Define install directories
export PYENV_ROOT="${HOME}/opt/pyenv"
export NVM_DIR="${HOME}/opt/nvm"

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
path_append "${HOME}/Android/Sdk/platform-tools"  # Android tools
path_prepend "${HOME}/.cargo/bin"  # local Rust binaries
path_prepend "${HOME}/.local/bin"  # local Python (pipx) binaries
path_prepend "${PYENV_ROOT}/bin"  # pyenv shims
path_prepend "${HOME}/bin"  # local scripts
export PATH=$(zsh -fc "typeset -TU P=${PATH} p; echo \$P")  # dedupe elements
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

alias jql='jq -C --unbuffered '.' | less -R'

# Typo aliases
alias gti=git
alias gut=git

# Load pyenv
[ -s "${PYENV_ROOT}/bin/pyenv" ] && eval "$(pyenv init -)"
[ -s "${PYENV_ROOT}/bin/pyenv" ] && eval "$(pyenv virtualenv-init -)"

# Load nvm
[ -s "${NVM_DIR}/nvm.sh" ] && . "${NVM_DIR}/nvm.sh" --no-use

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

# Configure prompt

# Enable redrawing of prompt variables
setopt promptsubst

# Configure git prompt
source ${HOME}/.git-prompt.sh
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1

# Define prompt
p_lf=$'\n'
if [ -n "${SSH_CONNECTION}" ]; then
    p_me='%n@%m'
elif [ "${LOGNAME}" != "${USER}" ]; then
    p_me='%n'
else
    p_me=''
fi
if [ -n "${p_me}" ]; then
    p_host="%B%F{green}${p_me}%f%b in "
else
    p_host=''
fi
p_path='%B%F{blue}%~%f%b'
p_indicator='%(?.%F{cyan}.%F{red})%#%f'
PROMPT="${p_lf}${p_host}${p_path}${p_lf}${p_indicator} "
RPROMPT='$(__git_ps1 " (%s)")'
unset p_host p_indicator p_lf p_path
