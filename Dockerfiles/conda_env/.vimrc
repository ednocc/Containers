set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
"Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'dense-analysis/ale'
"Plugin 'ycm-core/YouCompleteMe'
Plugin 'Townk/vim-autoclose'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'ryanoasis/vim-devicons'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
syntax on
set autoindent
set smartindent
set wrap
"set textwidth=80
set backspace=indent,eol,start
set encoding=utf8

" Set Proper Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

set hidden

" Highlight search into the document
set hlsearch

" Always display the status line
set laststatus=2

"set noshowmode

" You can use mouse inside vim
set mouse=a

"set noundofile

" Show linenumbers and current line
set number
set ruler
set cursorline

"set wildmenu
set autochdir

" Don't create a swap file used for save current work -> Dangerous
set noswapfile

" Map leader key
let mapleader = ","
let g:mapleader = ","

"if (has("termguicolors"))
"  set termguicolors
"endif

" Access colors present in 256 colorspace
"let base16colorspace=256 


""" ALE
" Enable completion where available.
let g:ale_completion_enabled=1
let g:ale_lint_on_save=1
let g:ale_fix_on_save=0
let g:ale_fixers={'python':['autopep8']}
let b:ale_linters={'python':['pylint']}

""" NERDTree
" Map new key to open NERTree windows
map <leader>nn :NERDTreeToggle<cr>
" Use Arrow for directory
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeShowHidden=1

""" Vim-Airline
" Vim-Airline Configuration
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 0
let g:airline_theme='angr'
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1

""" YouCompleteMe
let g:ycm_key_list_stop_completion = ['<C-w>']
" let g:ycm_key_invoke_completion = '<C-Space>'

""" Autoclose
let g:AutoClosePairs_add = "<>"
" Empêche l'insertion du texte pumvisible() ? lors de l'utilisation des fèches
" en mode insertion
let g:AutoClosePreserveDotReg = 0

""" Syntastic
" Syntastic Configuration
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1

""" Gruvbox
" Set colorscheme and background color
colorscheme gruvbox
set background=dark

" Wildmenu
"set wildmode=list:full
"set wildignorecase
"set wildignore=*.swp,*.bak
"set wildignore+=*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*
"set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*,*/node_modules/**/*
"set wildignore+=tags
"set wildignore+=*.tar.*

" Perso
inoremap vcls """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""<CR>
inoremap <leader>$$ ${}<left>
inoremap <leader>( ()<left>
inoremap <leader>[ []<left>
inoremap <leader>{ {}<left>
inoremap <leader>' ''<left>
inoremap <leader>" ""<left>
inoremap <leader>( ()<left>
inoremap <leader><> <><left>
inoremap <leader>ifs if [  ]<CR>then<CR>else<CR>fi<CR><up><up><up><up><right><right><right><right><right>
inoremap <leader>ifms if [[  ]]<CR>then<CR>else<CR>fi<CR><up><up><up><up><right><right><right><right><right><right>
inoremap <leader>mhh #$ -S /bin/bash<CR>#$ -V<CR>#$ -cwd<CR>#$ -e Log/<CR>#$ -o Log/<CR>#$ -N expand('%:t:r'))<CR>
inoremap <leader>pyhh #! /usr/bin/env python<CR>
inoremap <leader>shhh #! /bin/sh<CR>
inoremap <leader>bahh #! /bin/bash<CR>

nnoremap <leader>sv :source $MYVIMRC<CR>
