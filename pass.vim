set mouse=a  " enable mouse
set encoding=utf-8
set number
set cursorline
set noswapfile
set scrolloff = 10
set colorcolumn = 80

set fileformat=unix
filetype indent on

" horizontal split open below and right
set splitbelow
set splitright

call plug#begin('~/.vim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'loctvl842/monokai-pro.nvim'
Plug 'Pocco81/auto-save.nvim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
Plug 'bmatcuk/stylelint-lsp'

Plug 'nvim-telescope/telescope.nvim',  { 'branch': '0.1.x' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'nvim-lua/plenary.nvim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'lspcontainers/lspcontainers.nvim'
call plug#end()

" Netrw file explorer settings
let g:netrw_banner = 1
let g:netrw_liststyle = 3 " tree instead of plain view
let g:netrw_browse_split = 3 " vertical split window when Enter pressed on file

" Automatically format frontend files with prettier after file save
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" Disable quickfix window for prettier
let g:prettier#quickfix_enabled = 0

colorscheme monokai-pro-classic

" Display an error message.
function! s:Warn(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction

map gn :bn!<cr>
map gp :bp!<cr>

set guifont=Source\ Code\ Pro:h13
set linespace=0
let g:neovide_transparency = 1
let g:neovide_fullscreen = v:true

luafile .config/nvim/config.lua
