return {
    {
        'neovim/nvim-lspconfig',
        config = function()
            local lspconfig = require('lspconfig')

            lspconfig.pyright.setup{}
            lspconfig.bashls.setup{}  -- Bash/Shell
            lspconfig.html.setup{}  -- HTML
            lspconfig.cssls.setup{}  -- CSS
            lspconfig.intelephense.setup{}  -- PHP (Laravel)
            lspconfig.ts_ls.setup{}
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
            lspconfig.clangd.setup {
                capabilities = capabilities,
            }
        end,
    }
}
