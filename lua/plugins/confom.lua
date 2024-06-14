return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>FM",
      function()
        if vim.g.autoformat ~= nil then
          vim.g.autoformat = not vim.g.autoformat
        else
          vim.g.autoformat = true
        end

        print("Setting autoformat to: " .. tostring(not vim.g.autoformat))
      end,
      desc = "Toggle format on save",
    },
    {
      "<leader>FF", "<cmd>Format<cr>", mode = { "n", "x" }, { desc = "Format" }
    }
  },
  opts = {
    -- Define formatters
    formatters_by_ft = {
      lua = { "lua-ls", "stylua" },
      python = { { "pyright", "autopep8", "ruff-lsp", "ruff" } },
      rust = { "rust-analyzer" },
      javascript = { { "prettierd", "prettier", "eslint_d" } },
      javascriptreact = { { "prettierd", "prettier", "tailwindcss" } },
      typescript = { { "tsserver", "ts-standard", "eslint_d" } },
      typescriptreact = { "tsserver", "tailwindcss" },
      yaml = { "yamllint" },
      css = { "prettierd" },
      html = { "prettierd", "html-lsp" },
      json = { "prettierd" },
      markdown = { "prettierd", "markdownlint" },
    },
    -- Set up format-on-save
    format_on_save = function()
      if not vim.g.autoformat then
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
    vim.api.nvim_create_user_command("Format", function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      require("conform").format({ async = true, lsp_fallback = true, range = range })
    end, { range = true })

    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
