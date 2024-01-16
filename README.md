# My custom config for nvim
Custom config for Neovim inspired by ThePrimeagen's config and his video (https://github.com/ThePrimeagen/init.lua).

**NOTICE:**
You must install a terminal emulator for this setup to work correctly.
> MacOS
- [iterm2](https://iterm2.com/): Good terminal emulator for macOS
> Linux
- [terminator](https://gnome-terminator.org/): Good terminal emulator for linux that i have tested once :)

## Installation
Firstly, ensure Neovim is installed.
Then, clone the Packer repository somewhere via the terminal command.

> Unix, Linux Installation

```shell
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Next, clone this repo into ~/.config/ by executing the command below:
```shell
git clone --depth 1 https://github.com/KadyrPoyraz/nvim-config.git ~/.config/nvim
```
This command will clone this repo into the `~/.config/nvim directory`, which automatically sets this repo as your Nvim config.

From now you shuld install ```ripgrep``` in order to be able to use live_grep properly
> MacOS
```shell
brew install ripgrep
```
> Linux
```shell
sudo apt install ripgrep
```

After that, install all Packer packages by opening the Packer config:
```shell
nvim ~/.config/nvim/lua/kadyr/packer.lua
```
Then, execute the commands `:so` and `:PackerSync`, which will install all Packer packages. Afterward, run `:lua ColorMyAboba()`, which will set the color scheme. From that moment, you are good to go.

## TODO
Move from [packer](https://github.com/wbthomason/packer.nvim) to [lazy.nvim](https://github.com/folke/lazy.nvim) because packer has been unmaintained since August 2023
