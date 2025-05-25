set clipboard+=unnamed
set background=dark
set tabstop=2
set shiftwidth=2
set expandtab
set relativenumber
set nowrap
set noswapfile

let mapleader = " "
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 25

call plug#begin()
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'ellisonleao/gruvbox.nvim'
call plug#end()

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>dd :Lexplore %:p:h<CR>
nnoremap <Leader>da :e.<CR>

colorscheme gruvbox
