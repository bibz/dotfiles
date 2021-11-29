#######################################################################
# Install directories

export NVM_DIR="${HOME}/opt/nvm"
export PYENV_ROOT="${HOME}/opt/pyenv"


#######################################################################
# Multi-version language tooling
# (before $PATH extension because *I* decide how my $PATH is built up)

[ -s "${PYENV_ROOT}/bin/pyenv" ] && eval "$("${PYENV_ROOT}/bin/pyenv" init --path)"


#######################################################################
# $PATH extension

function path_prepend {
  if [ -d "$1" ]; then
    path=("$1" $path)
  fi
}

function path_append {
  if [ -d "$1" ]; then
    path=($path "$1")
  fi
}

typeset -U PATH path

# Note the order of preference is reversed (LIFO).
path_append "/snap/bin"  # Snaps
path_prepend "${HOME}/Android/Sdk/platform-tools"  # Android tools
path_prepend "${HOME}/.cargo/bin"  # local Rust binaries
path_prepend "${HOME}/.local/bin"  # local Python (pipx) binaries
path_prepend "${PYENV_ROOT}/bin"  # pyenv shims
path_prepend "${HOME}/bin"  # local scripts

export PATH

unset -f path_append
unset -f path_prepend


#######################################################################
# Miscellaneous

# Yeah, US, I know. It's only because it makes things easier for the CLI.
export LANG=en_US.UTF-8
