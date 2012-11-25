if v:progname =~? "evim"
  finish
endif

colorscheme zenburn
syntax on

set nocompatible
set backspace=indent,eol,start
set textwidth=0
set number
set softtabstop=2
set shiftwidth=2
set tabstop=8
set expandtab
set undolevels=1000
set showmode
set pastetoggle=<F11>
set hidden
"set list
set listchars=tab:»\ ,trail:·,eol:$
set formatoptions=cnoqr
set smartcase
set ignorecase
set laststatus=2
set encoding=utf8
set autoindent
set incsearch
set hlsearch
set complete=.,w,b,u,U,t,i,d
set showmatch
"filetype plugin indent on
"set fileencoding=utf8

if has("vertsplit")
  set cmdwinheight=10
endif

if has("statusline")
  set statusline=%<%f\ %h%m%r%=\ %-10.(%l,%c%V%)\ %P\ %{&fenc}\ %{&fo}
endif

if has("gui_running")
  "let moria_style='black'
  set guioptions=ic
  set shell=/usr/bin/uxterm
  set shellcmdflag=-e
  set guifont=DejaVu\ Sans\ Mono\ 14
endif

if has("cmdline_info")
  set showcmd
  set ruler
endif

if has("cmdline_hist")
  set history=50
endif

if has("linebreak")
  set linebreak
  set sbr=+>\ 
  set showtabline=2
endif

if has("autocmd")
  augroup filetypedetect
    autocmd BufRead,BufNewFile *.yicf setfiletype yicf
    autocmd filetype tex syn match texRefZone '\\citeonline\%([tp]\*\=\)\=' nextgroup=texRefOption,texCite
    autocmd filetype tex syn match texRefZone '\\citeauthor\%([tp]\*\=\)\=' nextgroup=texRefOption,texCite
  
    autocmd filetype tex set spell
    autocmd filetype mail set spell tw=72 fo=noqrt
    autocmd filetype xml set formatprg=/usr/bin/xmlstarlet\ fo
  augroup END
endif

if has("localmap")
  nmap <unique> <silent> <Leader>a :w %<CR> :!aspell -c %<CR> :e! %<CR>
  nmap <unique> <silent> <Leader>s :syn sync fromstart<CR>
  nmap <unique> <silent> <C-A-h> :tabprev<CR>
  nmap <unique> <silent> <C-A-l> :tabnext<CR>
  nmap <unique> <silent> <A-t> :tabnew<CR>
  nmap <unique> <silent> <A-w> :bd<CR>
  nmap <unique> <silent> <A-S-w> :close<CR>
  nmap <unique> <silent> <F5> :prev<CR>
  nmap <unique> <silent> <F6> :next<CR>
endif

if has("printer")
  set printoptions=paper:A4,syntax:y,number:n,wrap:y
endif

if filereadable("$HOME/.vimrc.local")
  source $HOME/.vimrc.local
endif
