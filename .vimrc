set nocompatible            " get rid of Vi compatibility mode. SET FIRST!
set shiftwidth=4            " Tab Options
set tabstop=4               " set expandtab "Enter spaces instead of tabs.

" {{{ Plugins
call vundle#begin()
    Plugin 'tpope/vim-sensible'                   " sensible defaults.
    Plugin 'bling/vim-airline'                    " Status line
    Plugin 'jeffkreeftmeijer/vim-numbertoggle'    " Auto relative number toggling
    Plugin 'airblade/vim-gitgutter'               " Live git changes
    Plugin 'tpope/vim-fugitive'                   " Complement git in vim - todo: learn this.
    Plugin 'tpope/vim-sleuth'                     " Auto spacing/indenting conformity to files
    Plugin 'terryma/vim-multiple-cursors'         " Muliple cursors, akin to sublime text
    Plugin 'jiangmiao/auto-pairs'                 " auto-pairs(brackets/quotes)
    Plugin 'scrooloose/nerdtree',                 {'on': ['NERDTreeToggle','NERDTreeFind']} " Side panel file browser.

    "Plugin 'Valloric/YouCompleteMe',              { 'do': './install.sh --clang-completer --system-libclang --omnisharp-completer', 'for': ['cpp', 'c', 'cs', 'python']}
    "Plugin 'rdnetto/YCM-Generator', 'stable'      " Generate ycm files - :YcmGenerateConfig

    Plugin 'mattn/emmet-vim',                     {'for': ['html', 'xml', 'xsl', 'xslt', 'xsd', 'css', 'sass', 'scss', 'less', 'mustache', 'php']}
    Plugin 'Valloric/MatchTagAlways',             {'for': ['html', 'xhtml', 'xml', 'jinja']}

    Plugin 'junegunn/fzf',                        {'dir': '~/fzf', 'do': 'yes\| ./install'} " based fuzzy search.
    Plugin 'chriskempson/base16-vim',

call vundle#end()            " required
" }}}

" {{{ Plugin settings
    " youcompleteme
    let g:ycm_autoclose_preview_window_after_completion = 1

    " airline
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_section=''
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = '│'

    " NerdTree
    " let NERDTreeShowHidden = 1
    " vim-multiple-cursors
    let g:multi_cursor_exit_from_visual_mode = 0
    let g:multi_cursor_exit_from_insert_mode = 0
" }}}

" {{{ keybinds
    " Define ' ' as map leader
    let mapleader = ' '
    let g:mapleader = ' '

    " indenting keybinds
    nnoremap <Tab> >>_
    nnoremap <S-Tab> <<_
    inoremap <S-Tab> <C-D>
    vnoremap <Tab> >gv
    vnoremap <S-Tab> <gv

    " copy visual
    map <C-c> "+y<CR>

    " NerdTree
    " silent! nmap <C-p> :NERDTreeToggle<CR>
    silent! map <F3> :NERDTreeFind<CR>
    let g:NERDTreeMapActivateNode="<F3>"
    let g:NERDTreeMapPreview="<F4>"
" }}}

" set title and allow hidden buffers
set title
set hidden
set list

" Auto remove all trailing whitespace on :w
autocmd BufWritePre * :%s/\s\+$//e

" Autosave files when focus is lost
:au FocusLost * :wa

" Line Numbers
set number
set numberwidth=3

" Path will be base dir that vim is opened from
set path=$PWD/**

set nomodeline
set noshowmode                                          " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set shortmess=atToOI                                    " To avoid the 'Hit Enter' prompts caused by the file messages
set undolevels=1000
set updatetime=1500
" Disable all bells
" set noerrorbells visualbell t_vb=

" Wild menu (Autocompletion)"
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.jpeg,*.png,*.xpm,*.gif
set wildmode=list:longest,full

" Backup and Swap
set nobackup
set nowritebackup
set noswapfile

" Search Options
set hlsearch   " Highlight search
set magic      " Set magic on, for regular expressions
set ignorecase " Searches are Non Case-sensitive
set smartcase

" Colors
set t_Co=256
let base16colorspace=256
colorscheme base16-default
set background=dark

" Encoding
set encoding=utf-8

" General UI Options
set showmatch          " Shows matching brackets when text indicator is over them
set cursorline
set scrolljump=10
set ttyfast            " Improves redrawing for newer computers
set pumheight=20       " popup menu height
set diffopt+=context:3
set nostartofline      " when moving thru the lines, the cursor will try to stay in the previous columns

" LAYOUT / TEXT FORMATTING
" Formatting Options
set wrap " Soft Wrap in all files, while hard wrap can be allow by filetype
set linebreak " It maintains the whole words when wrapping
set smartindent

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" gvim options - remove the toolbar.
set guioptions-=L
set guioptions-=T

" Remember last position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
