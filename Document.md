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
A series of comprehensive shortcut keys are set to distinguish and guide with different opts settings(opts, vopts, m_opts).
