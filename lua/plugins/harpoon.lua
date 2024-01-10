-- Harpoon

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  keys = {
    "<leader>a",
    "<leader>e",
    "<leader>1",
    "<leader>2",
    "<leader>3",
    "<leader>4",
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function(_, opts)
    local harpoon = require("harpoon"):setup(opts)

    vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end, { desc = "Add file to harpoon list" })
    vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
      { desc = "Toggle harpoon menu" })

    vim.keymap.set("n", "<leader>1", function() require("harpoon"):list():select(1) end, { desc = "Jump to file 1" })
    vim.keymap.set("n", "<leader>2", function() require("harpoon"):list():select(2) end, { desc = "Jump to file 2" })
    vim.keymap.set("n", "<leader>3", function() require("harpoon"):list():select(3) end, { desc = "Jump to file 3" })
    vim.keymap.set("n", "<leader>4", function() require("harpoon"):list():select(4) end, { desc = "Jump to file 4" })
  end,
  opts = {
    settings = {
      sync_on_ui_close = true,
    },
  },
}
