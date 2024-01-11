-- Oil file explorer
return {
  'stevearc/oil.nvim',
  keys = {
    { "-", "<cmd>Oil<cr>", { desc = "Open parent directory" } },
  },
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
}
