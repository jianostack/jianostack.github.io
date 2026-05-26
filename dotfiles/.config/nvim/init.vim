set clipboard+=unnamed
set background=dark
set tabstop=2
set shiftwidth=2
set expandtab
set relativenumber
set nowrap
set noswapfile
set list
set listchars=tab:»·,trail:·,eol:¬

let mapleader = " "
let g:netrw_banner = 0

call plug#begin()
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'ellisonleao/gruvbox.nvim'
Plug 'dense-analysis/ale'
call plug#end()

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fc <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <leader>da :Lexplore %:p:h<CR>
nnoremap <Leader>dd :Explore<CR>

colorscheme gruvbox

lua << EOF
require('telescope').setup{
pickers = {
  find_files = {
    hidden = "true",
    no_ignore = "true"
  }
  }
}

vim.lsp.config['lua_ls'] = {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.git' },
  settings = { Lua = { diagnostics = { globals = { "vim" } } } }
}
vim.lsp.enable('lua_ls')
EOF

" https://github.com/dense-analysis/ale/blob/master/supported-tools.md
let g:ale_linters = {
\   'json': ['prettier']
\}
" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

" trim whitespace
autocmd BufWritePre *.* :%s/\s\+$//e
