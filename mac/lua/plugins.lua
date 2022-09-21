-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- vscode dark+ theme
    use 'Mofiqul/vscode.nvim'
    -- better syntax highlighting
    use 'nvim-treesitter/nvim-treesitter'
end)

