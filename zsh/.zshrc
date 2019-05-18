source "${HOME}/.slimzsh/slim.zsh"

# Do not automatically fetch git remotes
PURE_GIT_PULL=0

# Drop the fancy prompt symbol for the classic dollar sign
PURE_PROMPT_SYMBOL=$

# Optionally include local binaries
for local_dir in bin .local/bin; do
  if [ -d "${HOME}/${local_dir}" ]; then
    PATH="${HOME}/${local_dir}:${PATH}"
  fi
done

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
