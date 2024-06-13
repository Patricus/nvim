-- Oil file explorer
return {
  'stevearc/oil.nvim',
  keys = {
    { "-", "<cmd>Oil<cr>", { desc = "Open parent directory" } },
  },
  opts = {
    default_file_explorer = true,
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    view_options = {
      show_hidden = true,
      natural_order = true,
      is_always_hidden = function(name, _)
        return name == '..' or name == '.git'
      end,
    },
    win_options = {
      wrap = true,
    }
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
}
