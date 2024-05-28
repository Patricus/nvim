-- Theme
return {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    opts = {
        colors = {
            onedark = {
                bg = "#000000",
            },
        },
        styles = {
            types = "NONE",
            methods = "NONE",
            numbers = "NONE",
            strings = "NONE",
            comments = "italic",
            keywords = "bold,italic",
            constants = "bold",
            functions = "italic",
            operators = "NONE",
            variables = "NONE",
            parameters = "NONE",
            conditionals = "italic",
            virtual_text = "NONE",
        },
    },
    config = function(_, opts)
        require('onedarkpro').setup(opts)
        vim.cmd.colorscheme 'onedark'
    end,
}

-- return {
--     'navarasu/onedark.nvim',
--     priority = 1000,
--     opts = {
--         style = "darker",
--         transparent = true,
--     },
--     config = function(_, opts)
--         require('onedark').setup(opts)
--         vim.cmd.colorscheme 'onedark'
--     end,
-- }
