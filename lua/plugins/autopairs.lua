return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {
        ignore_next_char = "[%w%.]", -- Idnore alphanumeric and `.` symbol
        check_ts = true,             -- Check Treesitter
    },
}
