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
