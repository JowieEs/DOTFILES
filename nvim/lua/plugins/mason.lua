return {
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        opts = {},
    },

    {
        "williamboman/mason-lspconfig.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "williamboman/mason.nvim" },
        opts = {
            ensure_installed = {
                "pyright",
                "clangd",
                "gopls",
                "astro",
                "vtsls",
                "html",
                "cssls",
                "emmet_ls",
            },
        },
    },

    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "williamboman/mason.nvim" },
        opts = {
            ensure_installed = {
                "black",
                "gofumpt",
                "clang-format",
                "prettier",
                "stylua",
            },
        },
    },
}
