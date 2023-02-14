# My Neovim Config
WARN: 本项目有前置依赖，具体可以查看lunarvim的依赖，毕竟这个项目来源于Lunarvim的贡献者[ChristianChiarulli](git@github.com:ChristianChiarulli/nvim.git)的neovim配置。
由于lunarvim只提供了基础的配置，像是lastplace，undotree等等很多好用的插件都需要自己加装, 虽然有详细的文档但是在别人的封装上加东西还是麻烦的，
还需要修改自己的键位配置。
需要注意几点：
1. 本配置依赖于nerd fonts字体，推荐使用Hack Nerd Fonts
2. node可能会出现权限的问题，这里建议使用nvm来安装nodejs，多版本还能避免这种奇怪的问题
3. 需要在.local.share.nvim下创建undo文件夹，用于undotree，可能还需要其他的，在看吧
## Try out this config

Make sure to remove or move your current `nvim` directory

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
TODO: This plug-in still has some shortcomings. For the functions with input requirements, there is no pop-up prompt. I hope it can be improved.

It is better to use the pop-up window to complete the operation of the specified parameter for the part that needs to be input
