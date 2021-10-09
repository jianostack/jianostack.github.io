
syntax on

set clipboard=unnamed
set nowrap
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set smartcase
set noswapfile
set nobackup
set incsearch
" set backspace=indent,eol,start 
" set laststatus=2
set list
" highlight ColorColumn ctermbg=0 guibg=lightgrey

let mapleader = " "
let g:netrw_banner = 0

call plug#begin()
Plug 'neovim/nvim-lspconfig'  " language server protocol
Plug 'nvim-lua/plenary.nvim'  " telescope
Plug 'nvim-telescope/telescope.nvim'  " telescope
Plug 'kyazdani42/nvim-tree.lua'  " file explorer
Plug 'hoob3rt/lualine.nvim'  " status line
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
call plug#end()

" noremap d "_d
" nnoremap dd "_dd
" vnoremap d "_d
" vnoremap dd "_dd
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

lua require('personal')
