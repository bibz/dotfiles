# dotfiles

My personal collection of dotfiles.
Factually more than that: I also store my personal setup here.

## Fresh installation

Bootstrap the system with basic requirements:

    % sudo apt update && sudo apt install git zsh
    % chsh -s "$(which zsh)"

Start a new Z shell session so that the installers will pick up the
right environment from the start:

    % zsh

Copy or clone this repository and setup the whole config:

    % ./setup all

Note that the login session needs to be restarted to load the whole
configuration (`.zprofile`):

    % exec zsh --login  # or log-out and log-in again

## Where to define environment variables and run session-wide scripts

- `.zprofile`: environment variables and session-wide (and/or slow start-up) programs
- `.zshrc`: any configuration related to the shell instance


### Others

- [`fasd`](https://github.com/clvv/fasd)
    ```git clone https://github.com/clvv/fasd.git ~/.fasd
       (cd ~/.fasd && PREFIX=$HOME make install)```
- Well-known SSH keys to clone the git repositories
- Gnome Terminal
  - Set custom font to `Hack Regular`
  - Unset `Show bold text in bright colors`
  - Add the Invisibone theme with `~/.config/dotfiles/bin/gnome-terminal-invisibone.sh`
