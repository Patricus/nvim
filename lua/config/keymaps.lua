-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>w', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Previous file
vim.keymap.set('n', '<leader><leader>', "<C-6>")

-- Cycling search centers to screen
vim.keymap.set('n', 'n', "nzz")
vim.keymap.set('n', 'N', "Nzz")

-- Replace word with yanked text
vim.keymap.set("x", "<leader>r", '"_dP')
vim.keymap.set("n", "<leader>r", 'viw"_dP')

-- Yank to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- Yank whole file
vim.keymap.set("n", "<leader>%", "<cmd>%y<cr>")

-- Paste from clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p')
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P')

-- Do things without affecting the registers
vim.keymap.set("n", "x", '"_x')
vim.keymap.set({ "n", "v" }, "<Leader>c", '"_c')
vim.keymap.set({ "n", "v" }, "<Leader>C", '"_C')
vim.keymap.set({ "n", "v" }, "<Leader>d", '"_d')
vim.keymap.set({ "n", "v" }, "<Leader>D", '"_D')

-- Quicklist navigation
vim.keymap.set("n", "[q", "<cmd>cprev<cr>zz")
vim.keymap.set("n", "]q", "<cmd>cnext<cr>zz")

-- Buffer navigation
vim.keymap.set("n", "[[", "<cmd>bprev<cr>")
vim.keymap.set("n", "]]", "<cmd>bnext<cr>")
vim.keymap.set("n", "<c-s>", "<cmd>w<cr><cmd>bd<cr>") -- Write and delete Buffer
vim.keymap.set("n", "<c-x>", "<cmd>bd<cr>")           -- Delete Buffer
