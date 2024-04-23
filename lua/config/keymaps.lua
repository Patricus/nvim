-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set({ 'n', 'v' }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ 'n', 'v' }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>w', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Previous file
vim.keymap.set('n', '<leader><leader>', "<C-6>")

-- Begining and end of line
vim.api.nvim_set_keymap("n", "E", "$", { noremap = false })
vim.api.nvim_set_keymap("n", "B", "^", { noremap = false })

-- Cycling search centers to screen
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- Replace word with yanked text
vim.keymap.set("x", "<leader>r", '"_dP')
vim.keymap.set("n", "<leader>r", 'viw"_dP')

-- Yank to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- Yank whole file
vim.keymap.set("n", "<leader>%", "<cmd>%y<cr>")

-- Yanl line without linebreak
vim.keymap.set("n", "YY", "^yg_")

-- Paste from clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p')
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P')

-- Do things without affecting the registers
vim.keymap.set("n", "x", '"_x')
vim.keymap.set({ "n", "v" }, "<Leader>c", '"_c')
vim.keymap.set({ "n", "v" }, "<Leader>C", '"_C')
vim.keymap.set({ "n", "v" }, "<Leader>d", '"_d')
vim.keymap.set({ "n", "v" }, "<Leader>D", '"_D')

-- Search and replace for word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Change file permissions
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Quicklist navigation
vim.keymap.set("n", "[q", "<cmd>cprev<cr>zz")
vim.keymap.set("n", "]q", "<cmd>cnext<cr>zz")

-- Buffer navigation
vim.keymap.set("n", "[b", "<cmd>bprev<cr>")
vim.keymap.set("n", "]b", "<cmd>bnext<cr>")
vim.keymap.set("n", "<c-q>", "<cmd>bd<cr>")

-- Continuous indents
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Resize windows
vim.keymap.set("n", "<m-k>", "<c-w>+") -- Increase height
vim.keymap.set("n", "<m-j>", "<c-w>-") -- Decrease height
vim.keymap.set("n", "<m-l>", "<c-w>>") -- Increase width
vim.keymap.set("n", "<m-h>", "<c-w><") -- Decrease width

vim.keymap.set("n", "<m-K>", "<c-w>_") -- Max height
vim.keymap.set("n", "<m-L>", "<c-w>|") -- Max width
vim.keymap.set("n", "<m-=>", "<c-w>=") -- Equalize window sizes
