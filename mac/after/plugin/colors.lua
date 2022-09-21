-- Lua:
-- For dark theme (neovim's default)
vim.o.background = 'dark'

require('vscode.colors')
require('vscode').setup({

    -- Enable italic comment
    italic_comments = true,

    -- Disable nvim-tree background color
    disable_nvimtree_bg = true,
    color_overrides = {
        vscBack = '#000000',
    },
})
