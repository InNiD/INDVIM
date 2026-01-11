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
set hidden
set list
set listchars=tab:»\ ,trail:·
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
set completeopt=menuone,noinsert
set shortmess+=c
autocmd FileType * setlocal formatoptions-=r formatoptions-=o
set nobackup
set noswapfile
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

" Plugins
" auto pop complete menu
inoremap <silent><expr>/ complete_info(["selected"])["selected"]!=-1&&getline(line('.'))[col('.')-2]=='/'?
            \ "\<bs>/\<c-x>\<c-f>":
            \ "/\<c-x>\<c-f>"
let g:cmpX=-1
let g:cmpY=-1
function! s:feed_popup()
    if getline('.')[col('.')-1]=='/'|return|endif
    let x = col('.') - 1|let y = line('.') - 1
    if g:cmpX==x&&g:cmpY==y|return|endif
    let s:min_complete=2
    let s:context=strpart(getline('.'), 0, col('.') - 1)
    let s:match= matchlist(s:context, '\(\k\{' . s:min_complete . ',}\)$')
    if empty(s:match)|return|endif
    silent! call feedkeys("\<c-n>", 'n')
    let g:cmpX=x|let g:cmpY=y
    return
endfunction
augroup Complete
    au!
    au CursorMovedI * nested call s:feed_popup()
augroup END


" gcc for comment
func! s:Commentary(line) abort
    let s:num=a:line
    let line=getline(s:num)
    let uncomment=2
    let [l, r] = split( substitute(substitute(substitute(
                \ &commentstring, '^$', '%s', ''), '\S\zs%s',' %s', '') ,'%s\ze\S', '%s ', ''), '%s', 1)
    let line = matchstr(getline(s:num),'\S.*\s\@<!')
    if l[-1:] ==# ' ' && stridx(line,l) == -1 && stridx(line,l[0:-2]) == 0|let l = l[:-2]|endif
    if r[0] ==# ' ' && line[-strlen(r):] != r && line[1-strlen(r):] == r[1:]|let r = r[1:]|endif
    if len(line) && (stridx(line,l) || line[strlen(line)-strlen(r) : -1] != r)|let uncomment = 0|endif
    let line=getline(s:num)
    let [l, r] = split( substitute(substitute(substitute(
                \ &commentstring, '^$', '%s', ''), '\S\zs%s',' %s', '') ,'%s\ze\S', '%s ', ''), '%s', 1)
    if strlen(r) > 2 && l.r !~# '\\'
        let line = substitute(line,
                    \'\M' . substitute(l, '\ze\S\s*$', '\\zs\\d\\*\\ze', '') . '\|' . substitute(r, '\S\zs', '\\zs\\d\\*\\ze', ''),
                    \'\=substitute(submatch(0)+1-uncomment,"^0$\\|^-\\d*$","","")','g')
    endif
    if uncomment
        let line = substitute(line,'\S.*\s\@<!','\=submatch(0)[strlen(l):-strlen(r)-1]','')
    else
        let line = substitute(line,'^\%('.matchstr(getline(s:num),'^\s*').'\|\s*\)\zs.*\S\@<=','\=l.submatch(0).r','')
    endif
    call setline(s:num,line)
endfunc
" visual gcc
func! s:VisualComment() abort
    for temp in range(min([line('.'),line('v')]),max([line('.'),line('v')]))
        call s:Commentary(temp)
    endfor
endfunc
nnoremap <silent><nowait>gcc :call <sid>Commentary(line('.'))<cr>
xnoremap <silent><nowait>gc  :call <sid>VisualComment()<cr>


" function GetMode()
    " let m = mode()|let s:str=''|let s:color='#9ECE6A'
    " if m == 'R'|let s:color='#F7768E'|let s:str= 'Replace'
    " elseif m == 'v'|let s:color='#F7768E'|let s:str= 'Visual'
    " elseif m == 'i'|let s:color='#7AA2F7'|let s:str= 'Insert'
    " elseif m == 't'|let s:color='#7AA2F7'|let s:str= 'Terminal'
    " else|let s:color='#9ECE6A'|let s:str= 'Normal'
    " endif
    " exec 'highlight User3 font=#000000 guifg=#1a1b26 guibg='.s:color
    " exec 'highlight User4 font=#000000 guifg='.s:color.' guibg=#232433'
    " redraw|return s:str
" endfunction

" let g:status_git_branch=""
" func! GitBranchShow(chan,msg)
    " let g:status_git_branch=" ".a:msg." "
" endfunc
" if g:status_git_branch==""
    " call job_start("git rev-parse --abbrev-ref HEAD",{"out_cb":"GitBranchShow"})
" endif

" set statusline=%3*\ %{GetMode()}\ 
" set statusline+=%4*%{g:status_git_branch}\ %y%m%r%h%w%=%f\ 
" set statusline+=%3*\ %P\ \ \ \ %l-%c\ 

" highlight User1 font=#000000 guifg=#1a1b26 guibg=#9ECE6A
" highlight User2 font=#000000 guifg=#9ECE6A guibg=#232433
" highlight User3 font=#000000 guifg=#1a1b26 guibg=#9ECE6A
" highlight User4 font=#000000 guifg=#9ECE6A guibg=#232433
" highlight User5 font=#000000 guifg=#1a1b26 guibg=#7AA2F7
" highlight User6 font=#000000 guifg=#7AA2F7 guibg=#232433


" explore
let g:netrw_liststyle = 3


" tabline
" let s:tab_after=""
" func! TabLine(direct)
    " let s:tab_result=""|let flag=0
    " if a:direct|return s:tab_after|else|let s:tab_after=""|endif
    " for buf in getbufinfo({'buflisted':1})
        " let s:name=buf.name
        " if strridx(buf.name,"/")!=-1|let s:name=strpart(buf.name,strridx(buf.name,"/")+1)|endif
        " if buf.name!=expand('%:p')
            " if flag==0|let s:tab_result=s:tab_result." ".s:name|else|let s:tab_after=s:tab_after." ".s:name.""|endif
        " else
            " let flag=1
        " endif
    " endfor
    " redrawt
    " return s:tab_result
" endfunc
" func! TabLineSet()
    " if &modified|let tab="%2* %0.32(%{TabLine(0)}%)%5* %t%6*%2*%<%{TabLine(1)}%r%h%w%=%6*%5* buffer"
    " else|let tab="%2* %0.32(%{TabLine(0)}%)%1* %t%2*%2*%<%{TabLine(1)}%r%h%w%=%2*%1* buffer"
    " endif
    " return tab
" endfunc
" set tabline=%!TabLineSet()


" sourround
let g:pair_map={'(':')','[':']','{':'}','"':'"',"'":"'",'<':'>','`':'`',}
func! s:AddSourround()
    let s:ch=nr2char(getchar())|let s:col=col('.')|let pos=getcurpos()
    norm! gv"sy
    let s:str = @s
    for k in keys(g:pair_map)
        if s:ch==k||s:ch==g:pair_map[k]
            execute ":s/^\\(.\\{".(col('.')-1)."\\}\\)".escape(s:str, '~"\.^$[]*')."/\\1".k.s:str.g:pair_map[k]."/"
            call setpos('.', pos)
            return
        endif
    endfor
    echo s:ch.' unknow pair'
endfunc
func! s:DelSourround()
    let s:ch=nr2char(getchar())
    if getline('.')[col('.')-1]!=s:ch|echo 'not begin with'.s:ch|return|endif
    for k in keys(g:pair_map)
        if s:ch==k|execute 'normal! xf'.g:pair_map[k].'x'|return|endif
    endfor
endfunc
func! s:ChangeSourround()
    let s:ch=nr2char(getchar())|let s:two=nr2char(getchar())
    let pos=getcurpos()
    if getline('.')[col('.')-1]!=s:ch|echo 'not begin with'.s:ch|return|endif
    execute 'normal! r'.s:two.'f'.g:pair_map[s:ch].'r'.g:pair_map[s:two]
    call setpos('.',pos)
endfunc
xnoremap <silent>S  :<c-u>call <sid>AddSourround()<cr>
nnoremap <silent>ds :call <sid>DelSourround()<cr>
nnoremap <silent>cs :call <sid>ChangeSourround()<cr>


" autopairs
" map enter
func! s:Enter()
    let ch=getline('.')[col('.')-1]|let last=getline('.')[col('.')-2]
    if ch=='}'&&last=='{'
        let str=matchstr(getline('.'),"^\\s*")
        call append(line('.'),str.ch)
        return "\<del>\<cr>"
    endif
    return "\<cr>"
endfunc
inoremap <silent><cr> <c-r>=<sid>Enter()<cr>

" set pair baket
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
cnoremap ( ()<left>
cnoremap [ []<left>
cnoremap { {}<left>

" jump
func! s:Judge(ch,mode)
    if a:mode!='c'
        let ch=getline('.')[col('.')-1]
    else
        let ch=getcmdline()[getcmdpos()-1]
    endif
    if a:ch=='"'||a:ch=="'"||a:ch=='`'
        if ch!=a:ch
            return a:ch.a:ch."\<left>"
        endif
    endif
    if ch==a:ch
        return "\<right>"
    endif
    return a:ch
endfunc
inoremap <expr><silent>" <sid>Judge('"','i')
inoremap <expr><silent>` <sid>Judge('`','i')
inoremap <expr><silent>' <sid>Judge("'",'i')
inoremap <expr><silent>> <sid>Judge('>','i')
inoremap <expr><silent>) <sid>Judge(')','i')
inoremap <expr><silent>} <sid>Judge('}','i')
inoremap <expr><silent>] <sid>Judge(']','i')
cnoremap <expr>" <sid>Judge('"','c')
cnoremap <expr>` <sid>Judge('`','c')
cnoremap <expr>' <sid>Judge("'",'c')
cnoremap <expr>> <sid>Judge('>','c')
cnoremap <expr>) <sid>Judge(')','c')
cnoremap <expr>} <sid>Judge('}','c')
cnoremap <expr>] <sid>Judge(']','c')
" set backspace
inoremap <expr><bs> <sid>Backspace('i')
cnoremap <expr><bs> <sid>Backspace('c')
func! s:Backspace(mode)
    if a:mode!='c'
        let s:pair=getline('.')[col('.')-1]|let s:pair_l=getline('.')[col('.')-2]
    else
        let s:pair=getcmdline()[getcmdpos()-1]|let s:pair_l=getcmdline()[getcmdpos()-2]
    endif
    if has_key(g:pair_map, s:pair_l)&&(g:pair_map[s:pair_l]==s:pair)
        return "\<right>\<bs>\<bs>"
    else
        return "\<bs>"
    endif
endfunc

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

