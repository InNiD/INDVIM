" Vim with all enhancements
" source $VIMRUNTIME/vimrc_example.vim

" Language
" set langmenu=none
language en

" Others
set nocompatible
let g:mapleader=" "
" set autochdir
set autoread
set belloff=all
set confirm
set list
set listchars=tab:>\ ,trail:·
set mouse=a
set scrolloff=8
set sidescrolloff=16
set splitbelow
set splitright
set nowrap
filetype plugin indent on
" set ttimeout
" set ttimeoutlen=100

" Appear
set background=dark
" let g:gruvbox_contrast_dark="soft"
" colorscheme gruvbox
colorscheme nord
syntax on
set cmdheight=1
set cursorline
set laststatus=2
set number
set relativenumber
set ruler
set showcmd
set showmode
set showtabline=2
set statusline=\ %f   " filename
set statusline+=\ %y " filetype
set statusline+=%m
set statusline+=%r
set statusline+=%h
set statusline+=%w
set statusline+=%=
set statusline+=%P\ \ \ \ %l-%c\ 
set title
set termguicolors
set t_Co=256

" Edit
set clipboard+=unnamed
set completeopt=menuone,noselect
autocmd FileType * setlocal formatoptions-=r formatoptions-=o
set nobackup
set noundofile
set showmatch
set wildoptions=pum
set virtualedit=block

" Search
set incsearch
set ignorecase
set smartcase

" Tab
set autoindent
set expandtab
set shiftround
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Kepmaps
nnoremap <silent><C-h> :tabp<CR>
nnoremap <silent><C-l> :tabn<CR>
nnoremap <Leader>ow :tabe<CR>:Explore<CR>
" nnoremap <silent><Leader>bh :bn<CR>
" nnoremap <silent><Leader>bl :bp<CR>
nnoremap <silent><Leader>bw :bd<CR>
nnoremap <silent><Leader>bo :tabo<CR>
nnoremap <Leader>bp :buffers<CR>:b<space>
nnoremap <Leader>bc :buffers<CR>:bd<space>

nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
nnoremap <silent><A--> :split<CR>
nnoremap <silent><A-\> :vsplit<CR>
nnoremap <silent><A-w> :close<CR>
nnoremap <silent><A-o> :only<CR>
nnoremap <silent><A-Up> :resize +2<CR>
nnoremap <silent><A-Down> :resize -2<CR>
nnoremap <silent><A-Left> :vertical resize -2<CR>
nnoremap <silent><A-Right> :vertical resize +2<CR>

nnoremap x "_x
nnoremap s "_s
nnoremap Y y$

inoremap jk <esc>
inoremap <silent><C-h> <C-\><C-n>:tabp<CR>i
inoremap <silent><C-l> <C-\><C-n>:tabn<CR>i
" inoremap <silent><C-h> <C-\><C-n>:bp<CR>i
" inoremap <silent><C-h> <C-\><C-n>:bp<CR>i

inoremap <A-h> <C-\><C-n><C-w>hi
inoremap <A-j> <C-\><C-n><C-w>ji
inoremap <A-k> <C-\><C-n><C-w>ki
inoremap <A-l> <C-\><C-n><C-w>li
inoremap <silent><A--> <C-\><C-n>:split<CR>i
inoremap <silent><A-\> <C-\><C-n>:vsplit<CR>i
inoremap <silent><A-w> <C-\><C-n>:close<CR>i
inoremap <silent><A-o> <C-\><C-n>:only<CR>i
inoremap <silent><A-Up> <C-\><C-n>:resize +2<CR>i
inoremap <silent><A-Down> <C-\><C-n>:resize -2<CR>i
inoremap <silent><A-Left> <C-\><C-n>:vertical resize -2<CR>i
inoremap <silent><A-Right> <C-\><C-n>:vertical resize +2<CR>i

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap < <gv
vnoremap > >gv

" auto comment
augroup vim
    autocmd!
    autocmd FileType vim nnoremap <buffer>gcc I"<space><esc>
augroup END

augroup verilog
    autocmd!
    autocmd FileType verilog nnoremap <buffer>gcc I//<space><esc>
augroup END

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

