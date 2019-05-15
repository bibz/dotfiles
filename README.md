# dotfiles

My personal collection of dotfiles

## Fresh installation

TODO: bootstrap with ansible?

### Pre-requisites

- `git`
- `stow`: [GNU Stow](https://gnu.org/software/stow/), the "symlink farm manager"
- `zsh`
    ```sudo apt install -y zsh```
- `font-hack-ttf`: The extravagantly useful `hack` font family
- Well-known SSH keys to clone the git repositories

### Installing the configuration files

1. Clone this repository, in e.g. `~/.config/dotfiles`.
2. Change directory and `stow` each and every program you
    want to configure, e.g. `stow zsh`.
