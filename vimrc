" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'neovim/nvim-lspconfig'
Plug 'dense-analysis/ale'
Plug 'rust-lang/rust.vim'

" StatusLine
Plug 'hoob3rt/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'
" Initialize plugin system
call plug#end()


" =======================================================
" # Editor settings
" =======================================================

lua << EOF
require('lualine').setup{
options = {theme = 'gruvbox'}
}
EOF

highlight ALEWarning ctermbg=DarkMagenta
filetype plugin indent on    " required
set autoindent
set encoding=utf-8

:syntax on
:set number

:packloadall
:silent! helptags ALL
:set title
"
syntax enable
filetype plugin indent on

autocmd BufNewFile,BufRead *.rs set filetype=rust


let g:ale_linters = {
\  'rust': ['analyzer'],
\}

let g:ale_fixers = { 'rust': ['rustfmt', 'trim_whitespace', 'remove_trailing_lines'] }
"
"" Optional, configure as-you-type completions
set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 1
let g:ale_set_highlights = 0
nnoremap <C-LeftMouse> :ALEGoToDefinition<CR>










" UNUSED POSSIBILITIES
" Plug 'EdenEast/nightfox.nvim'
"

":filetype indent on
":set termguicolors
":filetype plugin on
":set laststatus=2
":set statusline+=%F
"
"let g:nightfox_style = "nordfox"
"let g:nightfox_color_delimiter = "red"
"let g:nightfox_italic_comments = 1
" let g:nightfox_transparent = true
"set termguicolors
" Load the colorscheme
"colorscheme nightfox
"
"
"
" GUI Related
"Plugin 'itchyny/lightline.vim'
"Plugin 'machakann/vim-highlightedyank'
"Plugin 'andymass/vim-matchup'


" Syntax checking generic
"Plugin 'vim-syntastic/syntastic'


" Rust
"Plugin 'rust-lang/rust.vim'

" Rust formatting
"let g:rustfmt_autosave = 1

