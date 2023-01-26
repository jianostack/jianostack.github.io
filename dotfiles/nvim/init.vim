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
Plug 'nvim-lualine/lualine.nvim'
Plug 'Pocco81/auto-save.nvim'
call plug#end()

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

lua << END
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = ' ',
    section_separators = ' ',
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
END
