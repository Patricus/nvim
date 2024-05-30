-- LSP Configuration & Plugins
return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            { 'j-hui/fidget.nvim', opts = {} },

            -- Additional lua configuration
            {
                'folke/neodev.nvim',
                opts = {
                    plugins = { "nvim-dap-ui", types = true },
                },
            },
        },
        opts = {},
        config = function()
            -- Set Diagnostic Signs
            local function lspSymbol(name, icon)
                vim.fn.sign_define(
                    'DiagnosticSign' .. name,
                    { text = icon, numhl = 'DiagnosticDefault' .. name }
                )
            end
            lspSymbol('Error', '')
            lspSymbol('Information', '')
            lspSymbol('Hint', '')
            lspSymbol('Info', '')
            lspSymbol('Warning', '')

            local on_attach = function(_, bufnr)
                local nmap = function(keys, func, desc)
                    if desc then
                        desc = 'LSP: ' .. desc
                    end

                    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
                end

                nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
                nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

                nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
                nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
                nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
                nmap('<leader>td', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
                nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
                nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

                -- See `:help K` for why this keymap
                nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
                nmap('<M-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

                -- Lesser used LSP functionality
                nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
                nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
                nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
                nmap('<leader>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, '[W]orkspace [L]ist Folders')
            end

            -- Setup mason
            require('mason').setup()
            require('mason-lspconfig').setup()

            local servers = {
                -- clangd = {},
                -- gopls = {},
                pyright = {},
                rust_analyzer = {},
                tsserver = {},
                html = { filetypes = { 'html', 'twig', 'hbs' } },

                lua_ls = {
                    Lua = {
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                    },
                },
            }

            -- Setup neovim lua configuration
            require('neodev').setup()

            -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

            -- Ensure the servers above are installed
            local mason_lspconfig = require 'mason-lspconfig'

            mason_lspconfig.setup {
                ensure_installed = vim.tbl_keys(servers),
            }

            mason_lspconfig.setup_handlers {
                function(server_name)
                    if server_name ~= "rust_analyzer" then
                        require('lspconfig')[server_name].setup {
                            capabilities = capabilities,
                            on_attach = on_attach,
                            settings = servers[server_name],
                            filetypes = (servers[server_name] or {}).filetypes,
                        }
                    end
                end,
            }
        end

    },
    {
        'mrcjkb/rustaceanvim',
        version = '^4', -- Recommended
        lazy = false,   -- This plugin is already lazy
        init = function()
            vim.g.rustaceanvim = {
                server = {
                    cmd = function()
                        local mason_registry = require('mason-registry')
                        local ra_binary = mason_registry.is_installed('rust-analyzer')
                            -- This may need to be tweaked, depending on the operating system.
                            and mason_registry.get_package('rust-analyzer'):get_install_path() .. "/rust-analyzer"
                            or "rust-analyzer"
                        return { ra_binary } -- You can add args to the list, such as '--log-file'
                    end,
                },
            }
        end
    }
}
