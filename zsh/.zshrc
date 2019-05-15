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
