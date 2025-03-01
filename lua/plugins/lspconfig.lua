return {
    {
        'neovim/nvim-lspconfig',
        config = function()
            local lspconfig = require('lspconfig')

            lspconfig.pyright.setup{}
            lspconfig.bashls.setup{}
            lspconfig.html.setup{}
            lspconfig.cssls.setup{}
            lspconfig.intelephense.setup{}
            lspconfig.ts_ls.setup{}
            lspconfig.stimulus_ls.setup{}
            lspconfig.eslint.setup{}
            lspconfig.lua_ls.setup{
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT',
                            path = vim.split(package.path, ';'),
                        },
                        diagnostics = {
                            globals = {'vim'},
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            }
            lspconfig.clangd.setup {}
        end,
    }
}
