vim.api.nvim_create_autocmd("FileType", {
    pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    callback = function()
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
        vim.opt_local.expandtab = true
    end,
})

return {
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                typescript = {},
                typescriptreact = {},
                javascript = {},
                javascriptreact = {},
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                vtsls = {
                    settings = {
                        typescript = {
                            format = { enable = true },
                        },
                        javascript = {
                            format = { enable = true },
                        },
                    },
                },
            },
        },
    },
}
