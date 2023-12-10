syntax on

set clipboard=unnamed
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set smartcase
set ignorecase
set noswapfile
set nobackup
set incsearch
set list
set hlsearch

let mapleader = " "
let g:netrw_banner = 0
let g:netrw_liststyle = 3

call plug#begin()
Plug 'neovim/nvim-lspconfig'  " language server protocol
Plug 'nvim-lua/plenary.nvim'  " telescope dependency
Plug 'nvim-telescope/telescope.nvim'  " telescope
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " finder preview
Plug 'Pocco81/auto-save.nvim'
call plug#end()

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

