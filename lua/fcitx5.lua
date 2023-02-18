vim.cmd [[autocmd InsertLeave * :silent !fcitx5-remote -c]]
vim.cmd [[autocmd BufCreate * :silent !fcitx5-remote -c]]
vim.cmd [[autocmd BufEnter * :silent !fcitx5-remote -c]]
vim.cmd [[autocmd BufLeave * :silent !fcitx5-remote -c]]
