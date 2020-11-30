" (_)_ __ (_)| |_______(_)_ __ ____
" | | '_ \| || __\ \ / / | '_ ` _  \
" | | | | | || |_ \ V /| | | | | | |
" |_|_| |_|_|\__(_)\_/ |_|_| |_| |_|

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "Need curl"
  endif
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
endif
if executable('rustc')
  if executable('racer')
    let s:rust = 2
  else
    let s:rust = 1
  endif
endif
call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
      \ 'coc-emmet',
      \ 'coc-pairs',
      \ 'coc-snippets',
      \ 'coc-tailwindcss',
      \ 'coc-lists',
      \ 'coc-json',
      \ 'coc-html',
      \ 'coc-yank',
      \ 'coc-git',
      \ 'coc-gitignore',
      \ 'coc-highlight',
      \ 'coc-bookmark',
      \ 'coc-clangd',
      \ 'coc-explorer',
      \ 'coc-rls',
      \ 'coc-sql'
      \]
if exists('s:rust')
  Plug 'rust-lang/rust.vim', { 'for': 'rust' }
  if s:rust > 1
    Plug 'racer-rust/vim-racer', { 'for': 'rust' }
  endif
endif
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'ap/vim-css-color'
Plug 'jbyuki/instant.nvim'
let g:instant_username = "Burato"
Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
Plug 'tpope/vim-fugitive'
Plug 'ap/vim-buftabline'
let g:buftabline_show = 2
Plug 'dense-analysis/ale'
Plug 'danilo-augusto/vim-afterglow'
call plug#end()
set fillchars+=vert:\|
set completeopt=longest,menuone,preview
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
set completeopt-=preview"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'
autocmd CursorHold * silent call CocActionAsync('highlight')
command! -nargs=0 Format  :call CocAction('format')
command! -nargs=? Fold    :call CocAction('fold', <f-args>)
command! -nargs=0 OR      :call CocAction('runCommand', 'editor.action.organizeImport')
nnoremap J <C-e>
nnoremap K <C-y>
vnoremap L $
nnoremap H A
map <F2> :CocCommand explorer<CR>
map <F3> :set hlsearch!<CR>
map <F4> :set spell!<CR>
nmap <F5> :CocCommand bookmark.toggle<cr>
inoremap <F9> :set list<CR>
nnoremap <F6> mqHmwgg=G`wzt`q
let mapleader="\<space>"
nnoremap <Leader>a ggVG
nnoremap <leader>; A;<esc>
noremap <C-x> "+d
noremap <C-c> "+y
noremap <leader>s :w<cr>
nnoremap <leader>j <C-w>h
nnoremap <leader>ç <C-w>l
nnoremap <C-k> 2<C-w><
nnoremap <C-l> 2<C-w>>
nnoremap t :bn<CR>
nnoremap <S-t> :bp<CR>
nnoremap q :bd<CR>
nnoremap <S-q> :q<CR>
nnoremap <C-s> :SK<cr>
inoremap <expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
imap <C-ç> <Plug>(coc-snippets-expand)
vmap <C-k> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
imap <C-k> <Plug>(coc-snippets-expand-jump)
nmap <Leader>k <Plug>(coc-bookmark-next)
nmap <Leader>l <Plug>(coc-bookmark-prev)
filetype plugin indent on
set encoding=utf-8
set autoindent
set expandtab
set noerrorbells
set smartindent
set listchars=tab:▸\ ,eol:¬,trail:-,space:.
set shiftwidth=4
set tabstop=4
set smarttab
set updatetime=250
set shortmess+=c
set signcolumn=yes
set noai
set number
set mouse=a
set inccommand=split
set hidden
set scrolloff=10
set relativenumber
set shortmess+=Iat
set spelllang=pt_br,en
set ignorecase
set incsearch
set smartcase
set cursorline
set colorcolumn=80
set splitbelow splitright
set list
set title
set laststatus=2
set termguicolors
colorscheme afterglow
highlight Normal guibg=none
let g:afterglow_blackout=1
let g:afterglow_italic_comments=1
