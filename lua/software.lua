-- Collaboration with other programs

local opts = {noremap = true, silent = true}
local nopts = {noremap = true}
local term_opts = {silent = true}
local keymap = vim.api.nvim_set_keymap

-- lazygit
keymap("n", "\g", ":term lazygit<CR>", nopts)
keymap("n", "<C-g>", ":tabe<CR>:-tabmove<CR>:term lazygit<CR>", nopts)

-- st
keymap("n", "\t", ":tabe<CR>:-tabmove<CR>:term sh -c 'st'<CR><C-\><C-N>:q<CR>", nopts)
