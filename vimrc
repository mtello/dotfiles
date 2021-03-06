" .vimrc File
" Maintained by: Muhammad Tello
" MuhammadTello@icloud.com
" mtello.mrbenson.org

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" Forget compatibility with Vi. Who cares.
set nocompatible

"Enable filetypes
filetype on
filetype plugin on
filetype indent on
syntax on

" Set mouse to work everywhere, even in the terminal.
set mouse=a

" Write the old file out when switching between files.
set autowrite

" Set to auto read when a file is changed from the outside
set autoread

" Display current cursor position in lower right corner.
set ruler

" Switch between buffers without saving
set hidden

" Tab stuff
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Show command in bottom right portion of the screen
set showcmd

" Show lines numbers
set number

" Prefer relative line numbering?
"set relativenumber"

" Indent stuff
set smartindent
set autoindent

" Set clipboard
set clipboard=unnamedplus

" Always show the status line
set laststatus=2

" Prefer a slightly higher line height
set linespace=3

" Better line wrapping 
set wrap
set textwidth=79

" set formatoptions=qrn1
set formatoptions=t1
" set lbr

" Set incremental searching"
set incsearch

" Highlight searching
set hlsearch

" case insensitive search
set ignorecase
set smartcase

" set 256 bit color
"set t_Co=256

" Hide MacVim toolbar by default
set go-=T

" Enable code folding
set foldenable

" Hide mouse when typing
set mousehide

" Split windows below the current window.
set splitbelow

" session settings
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"PACKAGE SPECIFIC 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'mattn/livestyle-vim'
NeoBundle 'jceb/vim-orgmode'
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"
"CONFIGURATION 
"

" Dependent on installation of colorscheme bundle
set background=dark
colorscheme solarized


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Unbind the cursor keys in insert, normal and visual modes.
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Load the current buffer in Luakit - Linux specific.
abbrev ff :! luakit %:p<cr>


" Automatically change current directory to that of the file in the buffer
autocmd BufEnter * cd %:p:h

" More useful command-line completion
set wildmenu

" Auto-completion menu
set wildmode=list:longest


" Helpful abbreviations
iab lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
iab llorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 

" Spelling corrects. Just for example. Add yours below.
iab teh the
iab Teh The


" Saves file when Vim window loses focus
au FocusLost * :wa

" Backups
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap// " swap files
set backup " enable backup

set showmatch " show matching brackets

" print empty <a> tag
map! ;h <a href=""></a><ESC>5hi


"""""""""""""""""""""""""""""""""""""""""""""""""
" LEADER
"""""""""""""""""""""""""""""""""""""""""""""""""

" Want a different map leader than \
let mapleader=","

" Opens a vertical split and switches over (\v)
nnoremap <leader>v <C-w>v<C-w>l

" Hard-wrap paragraphs of text
nnoremap <leader>q gqip

" Shortcut for editing vimrc file in a new tab
nmap <leader>ev :tabedit $MYVIMRC<cr>

" Map code completion to leader + tab
imap <leader><tab> <C-x><C-o>

" Turn spelling on and off.
map <leader>ss :setlocal spell!<cr>

" Ever notice a slight lag after typing the leader key + command? This lowers
"the timeout.
set timeoutlen=1000

" pressing lead+space clears the search highlights
nmap <silent> <leader><space> :nohlsearch<CR>

" toggle paste mode (to paste properly indented text)
set pastetoggle=<leader>f


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEYMAPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" remove backspace ability, after all it's so fucking far away
imap <BS> <Nop>

" move by screen lines, not by real lines - great for creative writing
nnoremap j gj
nnoremap k gk
 
" also in visual mode
vnoremap j gj
vnoremap k gk

" move by screen lines, not by real lines - great for creative writing
nnoremap j gj
nnoremap k gk

" also in visual mode
vnoremap j gj
vnoremap k gk


" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l


" Map escape key to jj -- much faster, and remove <esc>
imap jj <esc>

" Delete all buffers (via Derek Wyatt)
nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>

" Bubble single lines (kicks butt)
"http://vimcasts.org/episodes/bubbling-text/
"nmap <C-Up> ddkP
"nmap <C-Down> ddp

" Bubble multiple lines
"vmap <C-Up> xkP`[V`]
"vmap <C-Down> xp`[V`]

" Saves time; maps the spacebar to colon
nmap <space> :

