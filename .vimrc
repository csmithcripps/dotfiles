filetype plugin on
set nocompatible


" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

syntax on
colorscheme accentedVIM


set colorcolumn =+10



augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END


" Status Line Settings
function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
    let l:branchname = GitBranch()
    return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction


set laststatus=2

set statusline=
set statusline+=\ \   
set statusline+=HackermanVIM
set statusline+=\ \   
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#Title#
set statusline+=\ \ 
set statusline+=%.40F
set statusline+=%m
set statusline+=%=
set statusline+=%{strftime('%c')}
set statusline+=\ \   
set statusline+=%#StatusLine#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c 
set statusline+=\ 


" Credit: CHRIS AYLING https://github.com/ChristopherAyling/dotfiles?fbclid=IwAR16hK_bre-t7JOBxrPFPGDHNTo64S3hh0zHtbNIxHYwMqRd-bXmpDQ-DK4"
set title
set shell=bash
set updatetime=1000
set ttyfast
set timeout timeoutlen=1000 ttimeoutlen=50
set autoread
set hidden


set nowrap

set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set title
set visualbell
set noerrorbells 
set scrolloff=4
set pastetoggle=<F2>

nmap <silent> ,/ :nohlsearch<CR>

set nobackup
set noswapfile

set number
noremap ; :
syntax enable

set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set copyindent
set shiftround
filetype indent on
set listchars=extends:#

set showcmd
set cursorline

set wildmenu
set wildmode=list:full

set lazyredraw
set showmatch

nnoremap j gj
nnoremap k gk

set smartcase
set hlsearch
set incsearch

""" vim tabs and status and splits
set showtabline=2
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>
map W <C-W>w
set splitright
set splitbelow

""" -------------------- NERDTree CONFIG -------------------------
" nerd tree opens files in different tabs
" let g:NERDTreeMapOpenInTab='<ENTER>'

" start NERDTree automatically on startup
" autocmd vimenter * NERDTree

let g:NERDTreeWinSize=50

" if NERDTreeTab is open --> NERDTreeToggle, else NERDTreeFind
function! OpenNERDTree()
    if exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
        NERDTreeToggle
    else
        " finds currently open file in NERDTree
        NERDTreeFind
    endif
endfunction

" map toggling nerd tree
nnoremap <C-p> :call OpenNERDTree()<CR>


