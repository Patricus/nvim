return {
    'ThePrimeagen/git-worktree.nvim',
    dependancies = {
        'nvim-telescope/telescope.nvim',
    },
    keys = {
        { "<leader>gg", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>",       { desc = "View git worktree branches" } },
        { "<leader>gn", "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", { desc = "Create new worktree branch" } },
    },
    opts = {
        change_directory_command = "cd",  -- default: "cd",
        update_on_change = true,          -- default: true,
        update_on_change_command = "e .", -- default: "e .",
        clearjumps_on_change = true,      -- default: true,
        autopush = false,                 -- default: false,
    },
    config = function(_, opts)
        require("git-worktree").setup(opts)
        require("telescope").load_extension("git-worktree")
    end,
}
