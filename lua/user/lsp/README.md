lsp配置部分有多个插件协同，但是在某个语言的时候出现问题那么就可能是mason语言服务器配置的问题。
# 问题汇总
## Rust : Client 1 quit with exit code and signal 0
问题很明确，运行Rust语言服务器的时候出现了错误，这个时候就需要检测lsp中对rust的配置，具体语言的配置在setting中.
当前发现的问题是由于执行73行rustup的时候出错，出错的原因有2个：
1. 对应位置没有rust-analyzer：去github找到进行安装
2. error: toolchain 'nightly-x86_64-unknown-linux-gnu' is not installed : 单独执行rustup这条语句的时候报的错误：`rustup toolchain install nightly-x86_64-unknown-linux-gnu` 安装对应确实既可。
