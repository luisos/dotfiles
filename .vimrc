lang C
language mes C
set langmenu=en_US.UTF-8

set nocompatible              " be iMproved, required
filetype off                  " required

"
"
" Vundle
" ======
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"
Plugin 'gmarik/Vundle.vim'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'   	    	" Lean & mean status/tabline for vim
Plugin 'vim-scripts/mru.vim'
"
" Edit
" ----
Plugin 'tpope/vim-capslock'
Plugin 'tpope/vim-surround'
Plugin 'Townk/vim-autoclose'
Plugin 'gregsexton/MatchTag'
"
" Syntax
" ------
"Plugin 'othree/html5.vim'
"Plugin 'hail2u/vim-css3-syntax'
"Plugin 'groenewege/vim-less'
"Plugin 'jelera/vim-javascript-syntax'
"Plugin 'digitaltoad/vim-pug'
"Plugin 'oraculo666/vim-m80'
"Plugin 'vim-scripts/oberon2.vim'
Plugin 'sheerun/vim-polyglot'
"Plugin 'oplatek/Conque-Shell'
"Plugin 'powerman/vim-plugin-autosess'
"Plugin 'majutsushi/tagbar'          	" Class/module browser
"Plugin 'lyokha/vim-xkbswitch'
"Plugin 'jeroenbourgois/vim-actionscript'
"Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'vim-scripts/closetag.vim'
"
" Snippets
" --------
Plugin 'garbas/vim-snipmate'		" Snippets manager
Plugin 'MarcWeber/vim-addon-mw-utils'	" dependencies #1
Plugin 'tomtom/tlib_vim'		" dependencies #2
Plugin 'honza/vim-snippets'		" snippets repo
"
" PHP
" ---
Plugin 'captbaritone/better-indent-support-for-php-with-html'
"
" Python
" ------
Plugin 'klen/python-mode'	        " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
Plugin 'davidhalter/jedi-vim' 		" Jedi-vim autocomplete plugin
Plugin 'mitsuhiko/vim-jinja'		" Jinja support for vim
Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim
"
call vundle#end()            		" required
"
" END Vundle 
" ==========

filetype on
filetype plugin on
filetype plugin indent on


"=====================================================
" General settings
"=====================================================
set backspace=indent,eol,start
"aunmenu Help
"aunmenu Window
let no_buffers_menu=1
set mousemodel=popup

set ruler
set completeopt-=preview
set gcr=a:blinkon0

if has("gui_running")
	set cursorline
endif

set ttyfast
syntax on

" Set 256 colors
set t_Co=256

colorscheme molokai


if has("gui_running")
" GUI? устаналиваем тему и размер окна
  set lines=50 columns=125
  set guifont=Consolas\ 11
endif

" set CWD to current file's dir
set autochdir
autocmd BufEnter * lcd %:p:h

" раскомментируйте эти строки, если хотите, чтобы NERDTree/TagBar автоматически отображались при запуске vim
"autocmd vimenter * TagbarToggle
"autocmd vimenter * NERDTree
"autocmd vimenter * if !argc() | NERDTree | endif
let NERDTreeQuitOnOpen=1
let g:NERDTreeChDirMode=2


tab sball
set switchbuf=useopen

" отключаем пищалку и мигание
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set enc=utf-8	     " utf-8 по дефолту в файлах
set ls=2             " всегда показываем статусбар
set incsearch	     " инкреминтируемый поиск
set hlsearch	     " подсветка результатов поиска
set nu	             " показывать номера строк
set scrolloff=5	     " 5 строк при скролле за раз


" отключаем бэкапы и своп-файлы
set nobackup 	     " no backup files
set nowritebackup    " only in case you don't want a backup file while editing
set noswapfile 	     " no swap files

" прячем панельки
set guioptions-=m   " меню
set guioptions-=T    " тулбар
"set guioptions-=r   "  скроллбары

" настройка на Tab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set linespace=3
autocmd FileType asm set tabstop=8
autocmd FileType asm set softtabstop=8
autocmd FileType asm set shiftwidth=8

"  при переходе за границу в 80 символов в Ruby/Python/js/C/C++ подсвечиваем на темном фоне текст
"augroup vimrc_autocmds
"    autocmd!
"    autocmd FileType ruby,python,javascript,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
"    autocmd FileType ruby,python,javascript,c,cpp match Excess /\%80v.*/
"    autocmd FileType ruby,python,javascript,c,cpp set nowrap
"augroup END

" указываем каталог с настройками SnipMate
"let g:snippets_dir = "~/.vim/vim-snippets/snippets"

" настройки Vim-Airline
let g:airline#extensions#disable_rtp_load = 1
set laststatus=2
set showcmd
set statusline=...%{exists('*CapsLockStatusline')?CapsLockStatusline():''}
let g:airline#extensions#capslock#enabled = 1
"let g:airline_theme='badwolf'
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" NerdTree настройки
" ------------------

" показать NERDTree на F3
map <F3> :NERDTreeToggle<CR>

"игноррируемые файлы с расширениями
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']
let NERDTreeQuitOnOpen=1

"=====================================================
" Python-mode settings
"=====================================================
let g:pymode_python = 'python3'

" отключаем автокомплит по коду (у нас вместо него используется jedi-vim)
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_options_max_line_length = 0

" документация
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'

" проверка кода
let g:pymode_lint = 1
let g:pymode_lint_on_write = 1
"let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore="E501,E201,E202,E265,W601,C0110"
let g:pymode_lint_write = 1

" поддержка virtualenv
let g:pymode_virtualenv = 1

" установка breakpoints
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" подстветка синтаксиса
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" отключить autofold по коду
let g:pymode_folding = 0

" возможность запускать код
let g:pymode_run = 0

" Disable choose first function/method at autocomplete
let g:jedi#popup_select_first = 0


" User hotkeys
" ============

" ConqueTerm
" запуск интерпретатора на F5
nnoremap <F5> :ConqueTermSplit ipython<CR>
" а debug-mode на <F6>
nnoremap <F6> :exe "ConqueTermSplit ipython " . expand("%")<CR>
let g:ConqueTerm_StartMessages = 0
let g:ConqueTerm_CloseOnEnd = 0
" проверка кода в соответствии с PEP8 через <leader>8
autocmd FileType python map <buffer> <leader>8 :PymodeLint<CR>

" автокомплит через <Ctrl+Space>
inoremap <C-space> <C-x><C-o>

" переключение между синтаксисами
"nnoremap <leader>Th :set ft=htmljinja<CR>
"nnoremap <leader>Tp :set ft=python<CR>
"nnoremap <leader>Tj :set ft=javascript<CR>
"nnoremap <leader>Tc :set ft=css<CR>
"nnoremap <leader>Td :set ft=django<CR>

if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif

nmap ; :

" view recent files
map <F2> :MRU<CR>
let MRU_Add_Menu = 0

" leader
let mapleader=","

" выключить подсветку поиска
nmap <cr> :nohl<cr>

" прокрутка прообелом
nmap <space> <c-d>
nmap <S-space> <c-d>

" subsitute " to '
nmap <leader>' :s/"/'/g<cr>
nmap <leader>" :s/'/"/g<cr>

" /* comment line */
nmap <leader>/ I/* <Esc>A */<Esc>

" Windows-like shortkeys
map <c-v> <M-v>
source $VIMRUNTIME/mswin.vim
map <F10> <Esc>:qa!<CR>
behave mswin
iunmap <c-y>

" Move visual block
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

" русский язык

"set keymap=ukrainian-enhanced
"autocmd VimEnter * set keymap=ukrainian-enhanced
"autocmd VimEnter * set keymap=russian-jcukenwin
"autocmd VimEnter * set iminsert=0
"autocmd VimEnter * set imsearch=0
"highlight lCursor guifg=NONE guibg=Cyan

" переключение языков по Ctrl-L
imap <c-l> <c-^>

"let g:XkbSwitchEnabled = 1
"set rtp+=~/.vim/bundle/Vundle.vim
"let g:XkbSwitchLib = 'c:\Users\valera\vimfiles\xkb-switch-win\libxkbswitch32.dll' 
"let g:XkbSwitchLib = 'c:/users/valera/vimfiles/xkb-switch-win/libxkbswitch32.dll' 
"let g:XkbSwitchIMappingsTrData = 'charmap.txt'
"let g:XkbSwitchIMappingsTrData = 'c:/users/valera/vimfiles/xkb-switch-win/charmap/charmap.txt'
"let g:XkbSwitchIMappings = ['ru', 'ua']

set autoindent
set nowrap

" disable comment continuing
"set formatoptions-=cro
autocmd FileType * setlocal formatoptions-=c formatoptions-=o formatoptions-=r

" copy to end of line
nmap Y y$

" goto first char in line
nmap 0 ^

" save session
map <F8> :mksession! session.vim<CR>
"au VimEnter * if filereadable('session.vim') | source session.vim | endif
"au VimLeave * if filewritable('session.vim') | mksession! session.vim | endif

" Edit .vimrc
map <F9> :tabnew $MYVIMRC<CR>

" Automatically source .vimrc on save.
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

" Navigate tabs
map <M-h> :tabfirst<CR>
map <M-j> :tabprevious<CR>
map <M-k> :tabnext<CR>
map <M-l> :tablast<CR>
map <M-n> :tabnew<CR>
map <M-q> :tabclose<CR>
map <M-J> :tabmove -1<cr>
map <M-K> :tabmove +1<cr>
map <M-1> 1gt
map <M-2> 2gt
map <M-3> 3gt
map <M-4> 4gt
map <M-5> 5gt
map <M-6> 6gt
map <M-7> 7gt
map <M-8> 8gt
map <M-9> 9gt

" Tabs in console
nmap gc :tabnew<CR>
nmap gn :tabnext<CR>
nmap gp :tabprev<CR>


" Navigate buffers
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-q> :q!<CR>


" Show tab numbers
set showtabline=2 " always show tabs in gvim, but not vim

" set up tab labels with tab number, buffer name, number of windows
function! GuiTabLabel()
  let label = ''
  let bufnrlist = tabpagebuflist(v:lnum)
  " Add '+' if one of the buffers in the tab page is modified
  for bufnr in bufnrlist
    if getbufvar(bufnr, "&modified")
      let label = '+'
      break
    endif
  endfor
  " Append the tab number
  let label .= v:lnum.' '
  " Append the buffer name
  let name = bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
  if name == ''
    " give a name to no-name documents
    if &buftype=='quickfix'
      let name = '[Quickfix List]'
    else
      let name = '[No Name]'
    endif
  else
    " get only the file name
    let name = fnamemodify(name,":t")
  endif
  let label .= name
  return label
endfunction
set guitablabel=%{GuiTabLabel()}


" Paste from selected register
function! RegPaste( cmd )
    reg
    echo "Register: "
    let char = nr2char( getchar() )
    if char != "\<Esc>"
        execute "normal! \"".char.a:cmd
    endif
    redraw
endfunction

nnoremap <Leader>p :call RegPaste( "p" )<CR>
nnoremap <Leader>P :call RegPaste( "P" )<CR>
