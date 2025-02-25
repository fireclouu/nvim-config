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
        end,
    }
}
