let mapleader = " "

set number relativenumber
set nocompatible

if has('filetype')
  filetype indent plugin on
endif
"
" => Color column
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" => Remove swap file
set noswapfile

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
set smartindent
set nostartofline
set ruler
set laststatus=2

" set confirm
set shiftwidth=4
set softtabstop=4
set expandtab

" Apro il terminale in basso
set splitbelow
set termwinsize=10x0

" keep 5 lines between the cursor and the edge of the screen
set scrolloff=6

" movimento tra i tabs
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

tmap <C-h> <C-W>h
tmap <C-j> <C-W>j
tmap <C-k> <C-W>k
tmap <C-l> <C-W>l

inoremap jj <esc>
cnoremap jj <C-C>

" => Help
nmap <leader>? :Maps<CR>

" => Windows resizing
nmap <C-left> <C-w>5<
nmap <C-right> <C-w>5>
nmap <C-down> <C-w>5+
nmap <C-up> <C-w>5-

tmap <C-left> <C-w>5<
tmap <C-right> <C-w>5>
tmap <C-down> <C-w>5+
tmap <C-up> <C-w>5-

nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
autocmd BufNewFile,BufRead *.{png,jpg,jpeg} :!feh % &

call plug#begin('~/.vim/plugged')

Plug 'mhinz/vim-startify'

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-tsserver','coc-prettier','coc-eslint','coc-json','coc-css']

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

inoremap <silent><expr> <cr> pumvisible() ?  coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

Plug 'Xuyuanp/nerdtree-git-plugin' 
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

Plug 'airblade/vim-gitgutter'
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'

Plug 'mhartington/oceanic-next'
 if (has("termguicolors"))
  set termguicolors
 endif
 
Plug 'franbach/miramare'
    let g:miramare_enable_italic = 1
    let g:miramare_disable_italic_comment = 1

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1

Plug 'tpope/vim-fugitive'
map <Leader>g :Git<CR>

" Emmet
Plug 'mattn/emmet-vim', {}
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nnoremap <silent> <C-p> :Buffers<CR>
" nnoremap <silent> <C-P> :Files<CR>
nnoremap <silent> <Leader>r :Rg<CR>
noremap <silent> <Leader>p :GFiles<cr>

Plug 'frazrepo/vim-rainbow'
let g:rainbow_active = 1

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" Snippets
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"                                       
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"   

" Plug 'vim-ctrlspace/vim-ctrlspace'
" nnoremap <silent><C-p> :CtrlSpace O<CR>
" nnoremap <leader>bn :bnext<CR>
" nnoremap <leader>bp :bprev<CR>
" nnoremap <leader>bb :CtrlSpace<CR>
" let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
" let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
" let g:CtrlSpaceSaveWorkspaceOnExit = 1
 
call plug#end()

colorscheme OceanicNext
let g:airline_theme='oceanicnext'
