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
- [Hack Nerd Font](https://www.nerdfonts.com/font-downloads)
    ```mkdir -p ~/.local/share/fonts
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
    unzip -d ~/.local/share/fonts Hack.zip
    rm Hack.zip
    fc-cache -v```
- [Starship](https://starship.rs) prompt
    (Bad practice but I reviewed that version at least.)
    ```test $(curl -fsSL https://starship.rs/install.sh | sha256sum) = '290950403651e1067e3d26f1046cce892f792417ffcbb465b641f473292e4f3e  -'
       sh -c "$(curl -fsSL https://starship.rs/install.sh)"```

### Installing the configuration files

1. Clone this repository, in e.g. `~/.config/dotfiles`.
2. Change directory and `stow` each and every program you
    want to configure, e.g. `stow zsh`.
