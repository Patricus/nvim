return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
            },
        },
        opts = {
            defaults = {
                mappings = {
                    i = {
                        ['<C-u>'] = false,
                        ['<C-d>'] = false,
                        -- ['<C-j>'] = require('telescope').actions.move_selection_next,
                        -- ['<C-k>'] = require('telescope').actions.move_selection_previous,
                    },
                    n = {
                        -- ["<esc>"] = require('telescope').actions.close,
                        -- ["j"] = require('telescope').actions.move_selection_next,
                        -- ["k"] = require('telescope').actions.move_selection_previous,
                        -- ["q"] = require('telescope').actions.close,
                    }
                },
                pickers = {
                    buffers = {
                        theme = "dropdown",
                        previewer = false,
                        initial_mode = "normal",
                        mappings = {
                            i = {
                                -- ["<C-d>"] = require('telescope').actions.delete_buffer,
                            },
                            n = {
                                -- ["dd"] = require('telescope').actions.delete_buffer,
                            },
                        },
                    },
                }
            },
        },
        config = function(_, opts)
            -- Telescope live_grep in git root
            -- Function to find the git root directory based on the current buffer's path
            local function find_git_root()
                -- Use the current buffer's path as the starting point for the git search
                local current_file = vim.api.nvim_buf_get_name(0)
                local current_dir
                local cwd = vim.fn.getcwd()
                -- If the buffer is not associated with a file, return nil
                if current_file == "" then
                    current_dir = cwd
                else
                    -- Extract the directory from the current file's path
                    current_dir = vim.fn.fnamemodify(current_file, ":h")
                end

                -- Find the Git root directory from the current file's path
                local git_root = vim.fn.systemlist("git -C " ..
                    vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
                if vim.v.shell_error ~= 0 then
                    print("Not a git repository. Searching on current working directory")
                    return cwd
                end
                return git_root
            end

            -- Custom live_grep function to search in git root
            local function live_grep_git_root()
                local git_root = find_git_root()
                if git_root then
                    require('telescope.builtin').live_grep({
                        search_dirs = { git_root },
                    })
                end
            end

            vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

            -- Keymaps
            vim.keymap.set('n', '<leader>fo', require('telescope.builtin').oldfiles,
                { desc = '[F]ind recently [O]pened files' })
            vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers,
                { desc = '[F]ind existing [B]uffers' })
            vim.keymap.set('n', '<leader>/', function()
                -- You can pass additional configuration to telescope to change theme, layout, etc.
                require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = false,
                })
            end, { desc = '[/] Fuzzily search in current buffer' })

            vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
            vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' })
            vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[F]ind [H]elp' })
            vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string,
                { desc = '[F]ind current [W]ord' })
            vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[F]ind by [G]rep' })
            vim.keymap.set('n', '<leader>fG', ':LiveGrepGitRoot<cr>', { desc = '[F]ind by [G]rep on Git Root' })
            vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[F]ind [D]iagnostics' })
            vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = '[F]ind [B]uffers' })
            vim.keymap.set('n', '<leader>fr', require('telescope.builtin').resume, { desc = '[F]ind [R]esume' })

            require('telescope').setup(opts)
            require('telescope').load_extension('fzf')
        end
    }
}
