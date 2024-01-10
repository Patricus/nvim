-- Autoclose

return {
  -- Automatically close strings, brackets, braces, etc.
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {
      ignore_next_char = "[%w%.]", -- Idnore alphanumeric and `.` symbol
      check_ts = true,             -- Check Treesitter
    },
  },

  -- Assist with tag changes
  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup({})
    end,
    lazy = true,
    event = "VeryLazy",
  },
}
