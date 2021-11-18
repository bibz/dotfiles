# dotfiles

My personal collection of dotfiles

## Fresh installation

TODO: bootstrap with ansible?

### Pre-requisites

- `command-not-found`
- `git`
  - `tig`
- `stow`: [GNU Stow](https://gnu.org/software/stow/), the "symlink farm manager"
- [`sublime`](https://www.sublimetext.com/docs/3/linux_repositories.html)
- `zsh`
    ```sudo apt install -y zsh```
  - [`slimzsh`](https://github.com/changs/slimzsh)
      ```git clone --recursive https://github.com/changs/slimzsh.git ~/.zslimzsh```
  - [`fasd`](https://github.com/clvv/fasd)
      ```git clone https://github.com/clvv/fasd.git ~/.fasd
         (cd ~/.fasd && PREFIX=$HOME make install)```
- `font-hack-ttf`: The extravagantly useful `Hack` font family
- Well-known SSH keys to clone the git repositories
- Gnome Terminal
  - Set custom font to `Hack Regular`
  - Unset `Show bold text in bright colors`
  - Add the Invisibone theme with `~/.config/dotfiles/bin/gnome-terminal-invisibone.sh`
- [`pyenv`](https://github.com/pyenv/pyenv) (consider using
  [`pyenv-installer`](https://github.com/pyenv/pyenv-installer))
- [`zsh-nvm`](https://github.com/lukechilds/zsh-nvm) to provide
  [`nvm`](https://github.com/nvm-sh/nvm/)
  - ```mkdir -p  ~/git/github.com/lukechilds/
       git clone https://github.com/lukechilds/zsh-nvm.git ~/git/github.com/lukechilds/zsh-nvm```
  - Initialise `nvm` by calling it for the first time: ```nvm```
  - Install (globally) the Node.js software you need

### Installing the configuration files

1. Clone this repository, in e.g. `~/.config/dotfiles`.
2. Change directory and `stow` each and every program you
    want to configure, e.g. `stow zsh`.
