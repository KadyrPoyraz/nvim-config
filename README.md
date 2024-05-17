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
# That's all! Open up your vim and enjoy the best text editor ever!
