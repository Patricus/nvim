return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<leader>FM",
      function()
        if vim.g.autoformat ~= nil then
          vim.g.autoformat = not vim.g.autoformat
        else
          vim.g.autoformat = true
        end

        print("Setting autoformat to: " .. tostring(vim.g.autoformat))
      end,
      desc = "Toggle format on save",
    },
  },
  -- Everything in opts will be passed to setup()
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      lua = { "lua-ls" },
      python = { { "pyright", "autopep8" } },
      rust = { "rust-analyzer" },
      javascript = { { "prettierd", "prettier" } },
      javascriptreact = { { "prettierd", "prettier", "tailwindcss" } },
      typescript = { { "tsserver", "ts-standard" } },
      typescriptreact = { "tsserver", "tailwindcss" },
    },
    -- Set up format-on-save
    format_on_save = function()
      if vim.g.autoformat then
        return { timeout_ms = 500, lsp_fallback = true }
      end
    end,
    -- Customize formatters
    formatters = {
      shfmt = {
        -- prepend_args = { "-i", "2" },
      },
    },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
