# My Neovim Config

## Try out this config

Make sure to remove or move your current `nvim` directory

```sh
git clone git@github.com:ChristianChiarulli/nvim.git ~/.config/nvim
```

Run `nvim` and wait for the plugins to be installed

**NOTE:** (You will notice treesitter pulling in a bunch of parsers the next time you open Neovim)

## Get healthy

Open `nvim` and enter the following:

```
:checkhealth
```

You'll probably notice you don't have support for copy/paste also that python and node haven't been setup

So let's fix that

First we'll fix copy/paste

- On mac `pbcopy` should be builtin

- On Ubuntu

  ```sh
  sudo apt install xsel
  ```

- On Arch Linux

  ```sh
  sudo pacman -S xsel
  ```

Next we need to install python support (node is optional)

- Neovim python support

  ```sh
  pip install pynvim
  ```

- Neovim node support

  ```sh
  npm i -g neovim
  ```

## Fonts

- [A nerd font](https://github.com/ryanoasis/nerd-fonts)

- [codicon](https://github.com/microsoft/vscode-codicons/raw/main/dist/codicon.ttf)
- [An emoji font](https://github.com/googlefonts/noto-emoji/blob/main/fonts/NotoColorEmoji.ttf)

After moving fonts to `~/.local/share/fonts/`

Run: `$ fc-cache -f -v`

**NOTE:** If you are seeing boxes without icons, try changing this line from `false` to `true` at user.icons.lua(many plugins use icons from this lua file)

## Java Debugging and Testing

```sh
git clone git@github.com:microsoft/java-debug.git
cd java-debug/
./mvnw clean install
```

```sh
git clone git@github.com:microsoft/vscode-java-test.git
cd vscode-java-test
npm install
npm run build-plugin
```

## Install latest rust-analyzer binary

```sh
$ mkdir -p ~/.local/bin
$ curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
$ chmod +x ~/.local/bin/rust-analyzer
```
## session manage
Use possession. A folder named 'possession' need create at .local/share/nvim/ . 
