-- Harpoon

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  keys = {
    {
      "<leader>a",
      function() require("harpoon"):list():append() end,
      desc = "Add file to harpoon list"
    },
    {
      "<leader>e",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Toggle harpoon menu"
    },
    {
      "<leader>1",
      function() require("harpoon"):list():select(1) end,
      desc = "Jump to file 1"
    },
    {
      "<leader>2",
      function() require("harpoon"):list():select(2) end,
      desc = "Jump to file 2"
    },
    {
      "<leader>3",
      function() require("harpoon"):list():select(3) end,
      desc = "Jump to file 3"
    },
    {
      "<leader>4",
      function() require("harpoon"):list():select(4) end,
      desc = "Jump to file 4"
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function(_, opts)
    require("harpoon"):setup(opts)
  end,
  opts = {
    settings = {
      save_on_toggle = true,
    },
  },
}
