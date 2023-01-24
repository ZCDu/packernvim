lsp配置部分有多个插件协同，但是在某个语言的时候出现问题那么就可能是mason语言服务器配置的问题。可以通过`Lspinfo`去查看
lsp涉及到的插件：
1. nvim-lspconfig : enable LSP
2. mason : nvim-lsp-installer的替代品，类似于VSCODE，提供了一系列功能的集合，如LSP，DAP
3. mason-lspconfig: 简化语言服务器的安装，类似于nvim-lsp-installer的安装形式
4. cmp-nvim-lsp:  提供语言服务器的cmp功能(代码补全)

> 针对具体语言服务器的配置文档，可以查看lspconfig官网

# 问题汇总
## Rust : Client 1 quit with exit code and signal 0
运行Rust语言服务器的时候出现了错误，这说明就是lsp导致的问题，可以通过`Lspinfo`来查看具体的错误, 配合`LspLog`更具体的查看出现问题的地方。
发现lsp中对rust的配置存在问题，具体语言的配置在setting中.
当前发现的问题是由于执行73行rustup的时候出错，出错的原因有2个：
1. 对应位置没有rust-analyzer：去github找到进行安装
2. error: toolchain 'nightly-x86_64-unknown-linux-gnu' is not installed : 单独执行rustup这条语句的时候报的错误：`rustup toolchain install nightly-x86_64-unknown-linux-gnu` 安装对应确实既可。

## Bash: Client 1 quit with exit code and signal 0
通过`LspLog`发现是在执行bash-language-server的时候出现了错误，这个问题是由于node的版本导致的，由于之前使用的是V12(因为LeetcodeCLI只支持到12)，更换node到新的版本安装`bash-language-server`就解决了
