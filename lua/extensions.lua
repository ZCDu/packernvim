local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the extensions.lua file 
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost extensions.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  -- snapshot = "july-24",
  snapshot_path = fn.stdpath "config" .. "/snapshots",
  max_jobs = 50,
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
    prompt_border = "rounded", -- Border style of prompt popups.
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- Plugin Mangager
  use "wbthomason/packer.nvim" -- Have packer manage itself

  -- Lua Development
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim, coc.nvim also used it
  use "christianchiarulli/lua-dev.nvim" -- Useful lua functions used by lots of plugins
  -- use "folke/lua-dev.nvim"

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  -- use "williamboman/nvim-lsp-installer" -- simple to use language server installer, but not update, mason is the iterative product
  use "williamboman/mason.nvim" -- the same author. like cocnvim, unified multiple functions 
  use "williamboman/mason-lspconfig.nvim" -- simple install lsp server like nvim-lsp-installer using mason
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "ray-x/lsp_signature.nvim" -- lsp support plugin. The list of parameters to be continued is displayed below the input.
  use "SmiteshP/nvim-navic" -- support lualine, show current code environment
  -- outline 
  use {"simrat39/symbols-outline.nvim", commit = "65742f3b9306bd6167e3e8561504932a0e3189ee"} -- subsitute for tagbar
  -- use "liuchengxu/vista.vim" -- above is not work
  -- use "stevearc/aerial.nvim"

  use "b0o/SchemaStore.nvim" -- used for SchemaStore
  -- use "github/copilot.vim"
  --[[
  use {
    "zbirenbaum/copilot.lua",
    event = { "VimEnter" },
    config = function()
      vim.defer_fn(function()
        require "user.copilot"
      end, 100)
    end,
  }
  --]]
  use "RRethy/vim-illuminate" -- hightlight current word
  use "j-hui/fidget.nvim" -- support for nvim-lsp
  use "lvimuser/lsp-inlayhints.nvim"
  -- use "simrat39/inlay-hints.nvim"
  use "https://git.sr.ht/~whynothugo/lsp_lines.nvim" -- diagnostics like rust debug, cool!!!

  -- Completion
  use "christianchiarulli/nvim-cmp" -- copy from hrsh7th
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp" -- 统合不同的代码补全能力, 如snippest或lsp
  use "hrsh7th/cmp-emoji"
  use "hrsh7th/cmp-nvim-lua"
  -- use "zbirenbaum/copilot-cmp"
  --[[
  use { "tzachar/cmp-tabnine", commit = "1a8fd2795e4317fd564da269cc64a2fa17ee854e", 
run = "./install.sh" }
	--]]

  -- Snippet
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- Syntax/Treesitter
  use "nvim-treesitter/nvim-treesitter"
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "p00f/nvim-ts-rainbow"
  use "nvim-treesitter/playground"
  use "windwp/nvim-ts-autotag"
  use "nvim-treesitter/nvim-treesitter-textobjects"
  -- use "wellle/targets.vim"
  -- use "RRethy/nvim-treesitter-textsubjects"
  use "kylechui/nvim-surround"
  --[[
  use {
    "abecodes/tabout.nvim",
    wants = { "nvim-treesitter" }, -- or require if not used so far
  }
  --]]

  -- Marks
  use "christianchiarulli/harpoon"
  use "MattesGroeger/vim-bookmarks"
  use "lfv89/vim-interestingwords"

  -- undotree
  use "jiaoshijie/undotree"

  -- Fuzzy Finder/Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-media-files.nvim"
  use "tom-anders/telescope-vim-bookmarks.nvim"

  -- Note Taking
  -- use "mickael-menu/zk-nvim"

  -- Color
  use "NvChad/nvim-colorizer.lua"
  use "ziontee113/color-picker.nvim"

  -- Colorschemes
  use "lunarvim/onedarker.nvim"
  use "lunarvim/darkplus.nvim"
  -- use "folke/tokyonight.nvim"
  -- use "lunarvim/colorschemes"

  -- Utility
  use "rcarriga/nvim-notify"
  use "stevearc/dressing.nvim"
  -- use "ghillb/cybu.nvim"
  use "moll/vim-bbye"
  use "lewis6991/impatient.nvim"
  use "lalitmee/browse.nvim"

  -- Registers
  -- use "tversteeg/registers.nvim"

  -- Icon
  use "kyazdani42/nvim-web-devicons"

  -- Debugging
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"
  -- use "theHamsta/nvim-dap-virtual-text"
  -- use "Pocco81/DAPInstall.nvim"

  -- Tabline
  use "akinsho/bufferline.nvim"
  -- use "tiagovla/scope.nvim"

  -- Statusline
  use "christianchiarulli/lualine.nvim" -- Statusline

  -- Startup
  use "goolord/alpha-nvim" -- substitute for dashboard-nvim

  -- Indent
  use "lukas-reineke/indent-blankline.nvim"

  -- File Explorer
  use "kyazdani42/nvim-tree.lua"
  use "christianchiarulli/lir.nvim"

  -- Comment
  -- use "numToStr/Comment.nvim"
  use "folke/todo-comments.nvim"

  -- Terminal
  use "akinsho/toggleterm.nvim"

  -- Project
  -- use "ahmedkhalf/project.nvim"
  use "nvim-pack/nvim-spectre"

  -- Session
  -- use {"rmagatti/auto-session", branch="dir-changed-fixes"}
  -- use "rmagatti/session-lens"
  use "Shatur/neovim-session-manager"

  -- Quickfix
  use "kevinhwang91/nvim-bqf"

  -- Code Runner
  use "is0n/jaq-nvim"
  --[[
  use {
    "0x100101/lab.nvim",
    run = "cd js && npm ci",
  }
  --]]

  -- Git
  use "lewis6991/gitsigns.nvim"
  -- use "f-person/git-blame.nvim"
  -- use "ruifm/gitlinker.nvim"
  -- use "mattn/vim-gist"
  -- use "mattn/webapi-vim"

  -- Github
  -- use "pwntester/octo.nvim"

  -- Editing Support
  use "windwp/nvim-autopairs"
  -- use "monaqa/dial.nvim"
  -- use "nacro90/numb.nvim"
  use "andymass/vim-matchup"
  use "folke/zen-mode.nvim"
  -- use "Pocco81/true-zen.nvim"
  -- use "karb94/neoscroll.nvim"
  -- use "junegunn/vim-slash"

  -- Motion
  -- use "phaazon/hop.nvim"
  -- use "jinh0/eyeliner.nvim"

  -- Keybinding
  use "folke/which-key.nvim"

  -- Java
  -- use "mfussenegger/nvim-jdtls"

  -- Rust
  use { "christianchiarulli/rust-tools.nvim", branch = "modularize_and_inlay_rewrite" }
  use "Saecki/crates.nvim"

  -- Typescript TODO: set this up, also add keybinds to ftplugin
  use "jose-elias-alvarez/typescript.nvim"

  -- Markdown
  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
  }

  -- Graveyard
  -- use "romgrk/nvim-treesitter-context"
  -- use "mizlan/iswap.nvim"
  -- use {'christianchiarulli/nvim-ts-rainbow'}
  -- use "nvim-telescope/telescope-ui-select.nvim"
  -- use "nvim-telescope/telescope-file-browser.nvim"
  -- use 'David-Kunz/cmp-npm' -- doesn't seem to work
  -- use { "christianchiarulli/JABS.nvim" }
  -- use "lunarvim/vim-solidity"
  -- use "tpope/vim-repeat"
  -- use "Shatur/neovim-session-manager"
  -- use "metakirby5/codi.vim"
  -- use { "nyngwang/NeoZoom.lua", branch = "neo-zoom-original" }
  -- use "rcarriga/cmp-dap"
  -- use "filipdutescu/renamer.nvim"
  -- use "https://github.com/rhysd/conflict-marker.vim"
  -- use "rebelot/kanagawa.nvim"
  -- use "unblevable/quick-scope"
  -- use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  -- use "gbprod/cutlass.nvim"
  -- use "christianchiarulli/lsp-inlay-hints"
  -- use "rmagatti/goto-preview"
  -- use "stevearc/aerial.nvim"
  -- use "nvim-lua/lsp_extensions.nvim"
  -- use { "christianchiarulli/nvim-gps", branch = "text_hl" }
  -- use "stevearc/stickybuf.nvim"
  -- use "folke/trouble.nvim"
  -- use "drybalka/tree-climber.nvim"
  -- use "phaazon/hop.nvim"
  -- use { "michaelb/sniprun", run = "bash ./install.sh" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
