-- Oil file explorer
return {
  'stevearc/oil.nvim',
  -- init = function()
    -- vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  -- end,
  keys = {
      { "-", "<cmd>Oil<cr>", { desc = "Open parent directory" } },
  },
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
