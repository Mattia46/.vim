if &compatible
	set nocompatible
end

execute pathogen#infect()
syntax on
filetype plugin indent on

filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
cal vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

"RUBY
"Plugin 'thoughtbot/vim-rspec'
"Plugin 'christoomey/vim-run-interactive'
"Plugin 'kchmck/vim-coffee-script'
"Plugin 'tpope/vim-bundler' "wraps bundle con :Bundle
"Plugin 'tpope/vim-endwise' "autocomplete def if etc
"Plugin 'tpope/vim-rails' "Rails shortcut
"Plugin 'vim-ruby/vim-ruby'

"Color Scheme
" Like Mac xcode default
Plugin 'cohlin/vim-colorschemes'

Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'pbrisbin/vim-mkdir' "crei una dir con :e
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-eunuch' "Vim sugar like :Move, :Rename etc
Plugin 'tpope/vim-fugitive' "Wrap all Git commang
Plugin 'tpope/vim-repeat' "Il punto ripete l'ultima azione
"Plugin 'tpope/vim-unimpaired' "pair the [{(
Plugin 'tpope/vim-surround'
"Plugin 'vim-scripts/ctags.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'morhetz/gruvbox' "retro theme that I am using
Plugin 'vim-scripts/tComment'
" Auto align
"Plugin 'vim-scripts/vimball'
"Plugin 'vim-scripts/Align'
"Plugin 'vim-scripts/AutoAlign'

"HTML
Plugin 'mattn/emmet-vim'
Plugin 'alvan/vim-closetag'
"let g:closetag_html_style=1

"ES6 Color
Plugin 'isRuslan/vim-es6'

"Markdown preview
Plugin 'JamshedVesuna/vim-markdown-preview' "ctrl+p opens it
let vim_markdown_preview_github=1 "serve perche' ho installato bower Grip invece di Markdown
"augroup markdown
    "au!
    "au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
"augroup END

"REACT
"Plugin 'pangloss/vim-javascript', { 'for': ['javascript.jsx']  }
"Plugin 'mxw/vim-jsx', { 'for': ['javascript.jsx']  }
"Plugin 'othree/javascript-libraries-syntax.vim'
"Plugin 'gavocanov/vim-js-indent'
"Plugin 'jelera/vim-javascript-syntax'
"let g:jsx_ext_required = 0 " Allow JSX in normal JS files
"let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_checkers = ['eslint']

" Snipmate
"Plugin 'SirVer/ultisnips'
"In order to use tab and shift-tab to complete the snippet
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
"Plugin 'honza/vim-snippets'

"Plugin 'pangloss/vim-javascript'

Plugin 'rking/ag.vim'

" Nice status bar
Plugin 'bling/vim-airline'

Plugin 'roman/golden-ratio' "auto-reside the windows
Plugin 'scrooloose/nerdtree'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/nerdcommenter'

" Tmux
" Plugin 'pivotal/tmux-config'
"Bundle 'roman/golden-ratio'
"Plugin 'danro/rename.vim'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'yssl/QFEnter'
"Plugin 'elzr/vim-json'
"if $TMUX == ''
  "set clipboard+=unnamed
"endif


Plugin 'sjl/vitality.vim' "Change Cursor
"Plugin 'Chiel92/vim-autoformat'
Plugin 'ntpeters/vim-better-whitespace'
"Plugin 'jeffkreeftmeijer/vim-numbertoggle'
"Plugin 'mustache/vim-mustache-handlebars'

call vundle#end()
filetype on


" Change <Leader>
let mapleader = ","

"Ctags
"set tags=./tags;/
set cpt-=t "evita che TAB chiami ctag scan e che quindi si sovrapponga all'autocomplete (wildmenu)


set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set autowrite     " Automatically :write before running commands
set laststatus=2  " Always shows the status line at the bottom
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set incsearch     " do incremental searching
"set hlsearch " "Highlights the searched workds. Undo :nohl
"set cursorline    " highlight the current line the cursor is on
"set complete=.,w,b,u,t,i
"set viminfo=
set colorcolumn=+1
set showmatch "flashes matching brackets or parentheses"
set wildmenu "Enable tab complete. First shows all matches, then starts cycling throught"


"set viminfo=
" Make it obvious where 80 characters is
set textwidth=120
"set colorcolumn=+1

" Softtabs, 2 spaces
set tabstop=4
set shiftwidth=4
"set autoindent
set softtabstop=4
set shiftround
set expandtab

"SEARCH (using AG instead of Grep)
let g:ackprg = 'ag --vimgrep' "After installing 'brew install the_silver_searcher', this line make it works

if executable('ag')
	" Use ag over grep
	set grepprg=ag\ --nogroup\ --nocolor

	" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

	" ag is fast enough that CtrlP doesn't need to cache
	let g:ctrlp_use_caching = 0
endif

"Search the word under the cursor
" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>
"END SEARCH

"EMMET LUNCH COMMAND
imap hh <C-y>,



" Easily spell check
" http://vimcasts.org/episodes/spell-checking/
nmap <silent> <leader>s :set spell!<CR>
set spelllang=en_gb
"/*[s Goes forward*/
"/*z= Gives the list of words to replace*/

" Enable spellchecking for Markdown
autocmd FileType markdown setlocal spell


"clipboard per copiare da vim ed incollare altrove:
set clipboard=unnamed

augroup vimrcEx
	autocmd!

	" Allow stylesheets to autocomplete hyphenated words
	autocmd FileType css,scss,sass setlocal iskeyword+=-
augroup END



" Move between splits
"nnoremap <S-Tab> <C-j>W
"nnoremap <Tab> <C-W><C-W>

"Fugitive map
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gm :diffget //2<CR>
nnoremap <leader>go :diffget //3<CR>
nnoremap <leader>gu :diffupdate<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :Glog -- % copen<CR>
"Shows the branch name for each version
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P


" Nerdtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.git','\.DS_Store','\.pdf', '.beam']
"let g:NERDTreeWinSize = 4
let NERDTreeHighlightCursorline = 1

" JJ escape
inoremap jj <ESC>:wa<CR>

" Indentation
noremap <Leader>i gg=G

" Autoformat
map <Leader>f :Autoformat<CR>

" such very magic
:nnoremap / /\v
:cnoremap %s/ %s/\v

"Move between windows
nnoremap <Tab> <C-W><C-W>
" numbering
set relativenumber
set number "mi da il numero assuluto della linea in cui sono
" Toggle relative line numbers
let g:NumberToggleTrigger="<leader>r" "without this <C-n>(relative number) will conflict with nerdTree

"set t_Co=256
set background=dark
"colorscheme gruvbox
syntax enable
let g:solarized_termcolors=256
let g:solarized_contrast = "high"
colorscheme solarized
"colorscheme lucius
"set background=light

set backspace=2   " Backspace deletes like most programs in insert mode
set nowritebackup
"set foldmethod=indent*/

nnoremap <space> za

"let g:ctrlp_custom_ignore = 'node_modules\'
"let g:ctrlp_custom_ignore = { 'dir':  '\v[\/](doc|tmp|node_modules)', }

"XCODE THEME
" Airline theme
"'let g:airline_theme = 'edocx"
" Vim colorscheme
"colorscheme xcode-default

" Setting dark mode
"set background=dark

"Cursor change
":autocmd InsertEnter * set cul
":autocmd InsertLeave * set nocul
" first, enable status line always
"set laststatus=2

" now set it up to change the status line based on mode
"if version >= 700
"au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
"au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
"endif
set runtimepath+=~/.vim/bundle/jshint2.vim/

"PYTHON
" UTF-8
set encoding=utf-8
" python pep8
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set textwidth=119
au BufNewFile,BufRead *.py set expandtab
"au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix

au FileType python map <silent> <leader>b oimport ipdb; ipdb.set_trace()<esc>
au FileType python map <silent> <leader>B Oimport ipdb; ipdb.set_trace()<esc>

""JAVASCRIPT & HTML
"au BufNewFile,BufRead *.js, *.jsx, *.html, *.css set tabstop=2
"au BufNewFile,BufRead *.js, *.jsx, *.html, *.css set softtabstop=2
"au BufNewFile,BufRead *.js, *.jsx, *.html, *.css set shiftwidth=2

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	else
		return "\<c-p>"
	endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

"open vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Pomodoro Thyme
nmap <leader>T :!thyme -d<cr><cr>

"PYTHON etc
"set foldlevel=99
"Enable folding with the spacebar instead of 'za'
"set fileformat=unix
"au BufNewFile, BufRead *.py
"\ set tabstop=4
"\ set shiftwidth=4
"\ set textwidth=79

"NEW STUFF FROM A VIDEO TALK
set path+=**
