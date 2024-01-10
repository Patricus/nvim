-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers and relative to cursor
vim.o.number = true
vim.o.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Use Windows clipboard if in WSL
local wslFile = io.open("/proc/sys/fs/binfmt_misc/WSLInterop", "r")
if wslFile ~= nil then
	io.close(wslFile)
	vim.g.clipboard = {
		name = 'WSLClipboard',
		copy = {
			['+'] = '/mnt/c/Windows/System32/clip.exe',
			['*'] = '/mnt/c/Windows/System32/clip.exe',
		},
		paste = {
			['+'] =
			'/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("\r", ""))',
			['*'] =
			'/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("\r", ""))',
		},
		cache_enabled = 0,
	}
end

-- Enable break indent
vim.o.breakindent = true

-- Tab settings
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Save undo history
vim.o.undofile = true
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.config/nvim/undo"

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Scroll padding
vim.o.scrolloff = 8

-- Decrease update time
vim.o.updatetime = 50
vim.o.timeoutlen = 500

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect,preview'

-- Terminal colors
vim.o.termguicolors = true

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = '*',
})
