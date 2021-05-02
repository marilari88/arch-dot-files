let mapleader = "," " map leader to comma
set relativenumber

set nocompatible

if has('filetype')
  filetype indent plugin on
endif

if has('syntax')
  syntax on
endif

set hidden
set wildmenu
set showcmd
set hlsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set autoindent
set nostartofline
set ruler
set laststatus=2

" set confirm
set shiftwidth=4
set softtabstop=4
set expandtab

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

call plug#begin('~/.vim/plugged')

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-tsserver','coc-prettier','coc-eslint']

nnoremap <silent> K :call CocAction('doHover')<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
nmap <leader>rn <Plug>(coc-rename)

" nerdtree
Plug 'preservim/nerdtree'
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1

" oceanic-next
Plug 'mhartington/oceanic-next'
 if (has("termguicolors"))
  set termguicolors
 endif

colorscheme OceanicNext

Plug 'tpope/vim-surround'

call plug#end()
