return {
  'nvim-pack/nvim-spectre',
  dependacies = {
    'nvim-lua/plenary.nvim',
  },
  keys = {
    {
      '<leader>S',
      function()
        require('spectre').toggle()
      end,
      { desc = 'Toggle spectre' },
    },
    {
      '<leader>sw',
      function()
        require('spectre').open_visual { select_word = true }
      end,
      { desc = 'Search current word' },
    },
    {
      'v',
      '<leader>sw',
      function()
        require('spectre').open_visual()
      end,
      { desc = 'Search current word' },
    },
    {
      '<leader>sf',
      function()
        require('spectre').open_file_search { select_word = true }
      end,
      { desc = 'Search on current file' },
    },
  },
}
