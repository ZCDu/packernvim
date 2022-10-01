local Path = require('plenary.path')
local status_ok, session_manager = pcall(require, "session_manager")
if not status_ok then
  vim.notify("session_manager not found!")
	return
end

-- local Path = require('plenary.path')
session_manager.setup({
  sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), -- The directory where the session files will be saved.
  path_replacer = '__', -- The character to which the path separator will be replaced for session files.
  colon_replacer = '++', -- The character to which the colon symbol will be replaced for session files.
  autoload_mode = require('session_manager.config').AutoloadMode.CurrentDir, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
  autosave_last_session = true, -- Automatically save last session on exit.
  autosave_ignore_not_normal = true, -- Plugin will not save a session when no writable and listed buffers are opened.
	autosave_ignore_filetype = {
		'gitcommit',
	},
  autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
	max_path_length = 80,
})

-- let nvim-tree open if last is opened
-- vim.cmd([[
-- 	augroup _open_nvim_tree
-- 		autocmd! * <buffer>
-- 		autocmd SessionLoadPost * silent! lua require("nvim-tree").toggle(false, true)
-- 	augroup end
-- ]])


local tele_status_ok, telescope = pcall(require, "telescope")
if not tele_status_ok then
	return
end

local tele_session_status_ok, telescope = pcall(telescope.load_extension, "sessions")
if not tele_session_status_ok then
	return
end

