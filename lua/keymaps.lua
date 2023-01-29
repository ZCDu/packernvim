M = {}
local opts = { noremap = true, silent = true }

local term_opts = { silent = true }
local nopts = { noremap = true}

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap("n", "<C-Space>", "<cmd>WhichKey \\<leader><cr>", opts)
keymap("n", "<C-i>", "<C-i>", opts)

-- quick open the neovim configure
keymap("n", "<leader>rc", ":e ~/.config/nvim/lua/keymaps.lua <cr>", nopts)
keymap("n", "<leader>re", ":e ~/.config/nvim/lua/extensions.lua <rc>", nopts)

-- Remove default map
keymap("n", "s", "<nop>", {})
keymap("n", "K", "<nop>", {})
keymap("n", "J", "<nop>", {})

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
-- keymap("n", "<C-w>", "<C-w>w", nopts)
keymap("n", "<C-k>", "<C-w>k", nopts)
keymap("n", "<C-j>", "<C-w>j", nopts)
keymap("n", "<C-h>", "<C-w>h", nopts)
keymap("n", "<C-l>", "<C-w>l", nopts)
-- keymap("n", "<m-tab>", "<c-6>", opts)
-- Place the two screens up and down
keymap("n", "sh", "<C-w>t<C-w>K", opts)
-- Place the two screens side by side
keymap("n", "sv", "<C-w>t<C-w>H", opts)
-- Rotate screens
keymap("n","srh", "<C-w>b<C-w>K", nopts)
keymap("n","srv", "<C-w>b<C-w>H", nopts)
-- split screens
keymap("n", "su", ":set nosplitbelow<CR>:split<CR>:set splitbelow<CR>", {})
keymap("n", "se", ":set splitbelow<CR>:split<CR>", {})
keymap("n", "si", ":set nosplitright<CR>:vsplit<CR>:set splitright<CR>", {})
keymap("n", "sn", ":set splitright<CR>:vsplit<CR>", {})
-- Resize splits with arrow keys
keymap("n", "<C-Up>", ":resize +5<CR>", nopts)
keymap("n", "<C-Down>", ":resize -5<CR>", nopts)
keymap("n", "<C-Left>", ":vertical resize -5<CR>", nopts)
keymap("n", "<C-Right>", ":vertical resize +5<CR>", nopts)

-- Indentation --
keymap("n", ">", ">>", nopts)
keymap("n", "<", "<<", nopts)

-- Tabs --
keymap("n", "<m-t>", ":tabnew %<cr>", opts)
keymap("n", "<m-y>", ":tabclose<cr>", opts)
keymap("n", "<m-\\>", ":tabonly<cr>", opts)

-- vim-bookmarks --
keymap("n", "mi", ":BookmarkAnnotate<cr>", {})
keymap("n", "ma", ":BookmarkShowAll<cr>", {})
keymap("n", "mc", ":BookmarkClear<cr>", {})
keymap("n", "mx", ":BookmarkClearAll<cr>", {})
keymap("n", "mm", ":BookmarkToggle<cr>", {})
keymap("n", "mn", ":BookmarkNext<cr>", {})
keymap("n", "mN", ":BookmarkPrev<cr>", {})

-- Copy to system clipboard -- 
keymap("v", "Y", '"+y', nopts)
keymap("v", "P", '"+p', nopts)

-- Naviagate buffers -- 
keymap("n", "<leader>j", ":BufferLinePick<CR>", opts)
keymap("n", "<leader>b", ":bnext<CR>", opts)
keymap("n", "<leader>v", ":bprevious<CR>", opts)
keymap("n", "<leader>d", ":Bdelete<CR>", opts)
-- bdelete will produce some errors, so, there use Bdelte. 
-- Neovim distinguishes the functions of Bdelete and bdelete, former delte one buffer, latter will attempt to delete all cause error.


-- Insert --
-- Press jk fast to enter
-- keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
-- keymap("v", "<", "<gv", opts)
-- keymap("v", ">", ">gv", opts)

-- Move text up and down
-- keymap("v", "<A-j>", ":m .+1<CR>==", opts)
-- keymap("v", "<A-k>", ":m .-2<CR>==", opts)
-- keymap("v", "p", '"_dP', opts)
-- keymap("v", "P", '"_dP', opts)

-- Visual Block --
-- Move text up and down, it looks cool, but not a frequent op
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Markdownpre --
keymap("n", "R", "<nop>", {})
vim.cmd [[
noremap R :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		CocCommand flutter.run
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run %
	endif
endfunc
]]

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Custom
-- keymap("n", "<c-h>", "<cmd>nohlsearch<cr>", opts)
-- NOTE: the fact that tab and ctrl-i are the same is stupid
keymap("n", "<TAB>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
keymap("n", "Q", "<cmd>Bdelete!<CR>", opts)
-- keymap("n", "<F4>", "<cmd>Telescope resume<cr>", opts)
keymap("n", "<F5>", "<cmd>Telescope commands<CR>", opts)
keymap("n", "<leader>n", "<cmd>Telescope find_files<CR>", opts)

keymap("n", "<F8>", "<cmd>TSHighlightCapturesUnderCursor<cr>", opts) --treesitter提供的好用功能
-- keymap("n", "<F8>", "<cmd>TSPlaygroundToggle<cr>", opts) -- 显示编译的树结构，看不懂
keymap("n", "<F11>", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "<F12>", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("v", "//", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], opts)
keymap("n", "<C-p>", "<cmd>Telescope projects<cr>", opts)
keymap("n", "<C-t>", "<cmd>lua vim.lsp.buf.document_symbol()<cr>", opts)
-- keymap("n", "<C-s>", "<cmd>vsplit<cr>", opts)
keymap("n", "<C-x>", "<cmd>ZenMode<cr>", opts) -- 专注模式

-- keymap("n", "-", ":lua require'lir.float'.toggle()<cr>", opts) -- get a float terminal, but have a error
-- keymap("n", "<C-\\>", "<cmd>vsplit<cr>", opts)
-- vim.cmd[[nnoremap c* /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn]]
-- vim.cmd[[nnoremap c# ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN]]
-- keymap("n", "c*", [[/\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn]], opts)
-- keymap("n", "c#", [[?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN]], opts)
-- keymap("n", "gx", [[:execute '!brave ' . shellescape(expand('<cfile>'), 1)<CR>]], opts)
-- Browser --
keymap("n", "gx", [[:silent execute '!$BROWSER ' . shellescape(expand('<cfile>'), 1)<CR>]], opts) -- quick browse the selected web

-- Change '<CR>' to whatever shortcut you like :)
-- vim.api.nvim_set_keymap("n", "<CR>", "<cmd>NeoZoomToggle<CR>", { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "=", "<cmd>JABSOpen<cr>", { noremap = true, silent = true, nowait = true })

-- alt binds
-- keymap("n", "<m-s>", "<cmd>split<cr>", opts)
keymap("n", "<m-v>", "<cmd>lua require('lsp_lines').toggle()<cr>", opts)
-- keymap("n", "<m-q>", "<cmd>:q<cr>", opts)

M.show_documentation = function()
  local filetype = vim.bo.filetype
  if vim.tbl_contains({ "vim", "help" }, filetype) then
    vim.cmd("h " .. vim.fn.expand "<cword>")
  elseif vim.tbl_contains({ "man" }, filetype) then
    vim.cmd("Man " .. vim.fn.expand "<cword>")
  elseif vim.fn.expand "%:t" == "Cargo.toml" then
    require("crates").show_popup()
  else
    vim.lsp.buf.hover()
  end
end
vim.api.nvim_set_keymap("n", "K", ":lua require('user.keymaps').show_documentation()<CR>", opts)

-- vim.api.nvim_set_keymap("n", "<m-b>", "<cmd>lua require('user.bfs').open()<cr>", opts)
-- vim.api.nvim_set_keymap("n", "<m-b>", "<cmd>JABSOpen<cr>", opts)

-- Nvim-tree -- 
vim.api.nvim_set_keymap("", "<C-n>", ":NvimTreeToggle<cr>", {})

-- symbols-outline --
keymap("n", "T", ":SymbolsOutline<CR>", {})

-- possession --
keymap("n", "<F2>", ":PossessionSave ", opts)
keymap("n", "<F3>", ":PossessionList<cr>", opts)
keymap("n", "<F4>", ":PossessionDelete ", opts)

-- undotree -- 
vim.keymap.set("n", "<F7>", require('undotree').toggle, opts)

-- Comment -- 
-- keymap("n", "<m-/>", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
-- keymap("x", "<m-/>", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', opts)

-- Telescope -- 
-- vim.api.nvim_set_keymap(
--   "n",
--   "<m-f>",
--   "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
--   opts
-- )
-- vim.api.nvim_set_keymap(
--   "n",
--   "<tab>",
--   "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
--   opts
-- )
-- vim.api.nvim_set_keymap("n", "<tab>", "<cmd>lua require('telescope.builtin').extensions.harpoon.marks(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal'})<cr>", opts)

--[[
vim.api.nvim_set_keymap(
  "n",
  "<tab>",
  "<cmd>lua require('telescope').extensions.harpoon.marks(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal', prompt_title='Harpoon'})<cr>",
  opts
)
--]]
vim.api.nvim_set_keymap(
  "n",
  "<s-tab>",
  "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal'})<cr>",
  opts
)
-- vim.api.nvim_set_keymap("n", "<tab>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
vim.api.nvim_set_keymap("n", "<m-g>", "<cmd>Telescope git_branches<cr>", opts)
vim.api.nvim_set_keymap("n", "<s-enter>", "<cmd>TodoQuickFix<cr>", opts)
-- l = { "<cmd>lua require('user.bfs').open()<cr>", "Buffers" },

vim.cmd [[
  function! QuickFixToggle()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
    else
      cclose
    endif
  endfunction
]]

keymap("n", "<m-q>", ":call QuickFixToggle()<cr>", opts)
-- keymap("n", "<c-l>", "<cmd>lua vim.lsp.codelens.run()<cr>", opts)

return M
