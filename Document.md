# user
options : 基础配置，如缩进长度，是否显示行号等
## lsp
Use mason auto manage all lsp
### setttings
Configure the default language server. The default configuration of Mason is not used. The LSP configured in this way will be installed at the first installation, simple setting could be find at [server_simple_setting](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)
## navic
Show file context at top-left, It needs to confirm whether the icon is displayed correctly.If not, navic icons should be changed.

## nvim-lspconfig
### button setting
Its configuration is similar to coc.nvim . All of these configurations are in lsp/handlers.lua

## nvim-tree
All the icons are from plugin nvim-web-devicons. 
### diagnostics
nvim-tree also can show file status(hint, info, warning, error) with diagnostics.

## bufferline
Provides viewing of cache pool information.
bufferline is depend on nvim-web-devicons and vim-bbye(Improve the comfort of use.)

## whichkey
A series of comprehensive shortcut keys are set to distinguish and guide with different opts settings(opts, vopts, m_opts). 通过配置，whichkey可以使用多种不同的引导键

# null-ls
provides formatting.
There are some interesting functions which can be found at null-ls/builtins:
1. code_actions
2. completion
3. diagnostics
4. formatting
5. hover 悬停显示功能

# symbol-outline 
指定的版本是可以运行的。

# possession
session manage. It need input a session name to save. Use Possesion to open the code.

# tree-sitter
使得nvim支持tree-sitter，不需要额外安装tree-sitter
```shell
cargo install tree-sitter-cli
```
也可以通过npm进行安装：
```shell
npm install tree-sitter-cli
```
## 来源
[Tree-sitter CLI](https://github.com/tree-sitter/tree-sitter/blob/master/cli/README.md)

# toggleterm
能够实现在neovim中按指定的要求打开终端，具体配置查看toggleterm的配置文档, 但是当前不能很好的vim进行控制的切换，需要配置一下
