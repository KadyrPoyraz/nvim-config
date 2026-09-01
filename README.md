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

Next, clone this repo into ~/.config/ by executing the command below:
```shell
git clone --depth 1 https://github.com/KadyrPoyraz/nvim-config.git ~/.config/nvim
```
This command will clone this repo into the `~/.config/nvim directory`, which automatically sets this repo as your Nvim config.

Start Neovim once and `lazy.nvim` will install the configured plugins automatically.

From now you shuld install ```ripgrep``` in order to be able to use live_grep properly
> MacOS
```shell
brew install ripgrep
```
> Linux
```shell
sudo apt install ripgrep
```

## OpenCode

Install the OpenCode CLI:

```shell
brew install anomalyco/tap/opencode
```

Open Neovim and verify the integration with:

```vim
:checkhealth opencode
```

Keymaps:

- `<leader>ot` toggles the OpenCode side terminal.
- `<leader>oa` asks OpenCode about the current selection or cursor context.
- `<leader>oo` opens the OpenCode action picker.
- `<leader>or` sends a review prompt.
- `<leader>oi` sends an implement prompt.
- `<leader>of` sends a fix prompt.
- `go` followed by a motion sends that range to OpenCode.
- `goo` sends the current line to OpenCode.

When OpenCode proposes file edits, review the diff and use:

- `da` to accept the full edit.
- `dr` to reject the full edit.
- `dp` to accept only the hunk under the cursor.
- `do` to reject only the hunk under the cursor.

# That's all! Open up your vim and enjoy the best text editor ever!
