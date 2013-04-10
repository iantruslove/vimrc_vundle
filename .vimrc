set nocompatible               " be iMproved
filetype off                   " required!
filetype indent plugin on
syn on

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github

" Version control plugins
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'

Bundle 'Lokaltog/vim-easymotion'

" HTML Zen coding
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

" Nice colors
Bundle 'flazz/vim-colorschemes'
"colorscheme bensday
"colorscheme af
"colorscheme gentooish
colorscheme anotherdark
"colorscheme blacklight

" Tree-based file browser.  `,nn` toggles.
Bundle 'scrooloose/nerdtree'
nmap ,nn :NERDTreeToggle<CR>

" Easy commenting and uncommenting. `\cc`
Bundle 'scrooloose/nerdcommenter'

" punctuation pairing
Bundle 'kana/vim-smartinput'

" Better tab completion
Bundle 'ervandew/supertab'

" Commands to change surroundings (e.g. changing quotes, adding parens, ...)
Bundle 'tpope/vim-surround'

"Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'

" Clojure
Bundle 'tpope/vim-fireplace'
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-classpath.git'
Bundle 'jpalardy/vim-slime'
let g:slime_target = "tmux"

"Bundle 'vim-scripts/slimv.vim'

" Nice fuzzy matching file finder
Bundle 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_working_path_mode = 0 " just use vim's PWD as the root of the ctrlp search"

" Improved match (%) functionality for XML, HTML
Bundle 'vim-scripts/matchit.zip'

" Tab completion ftw
Bundle 'ervandew/supertab'

" Fancy status line
Bundle 'Lokaltog/vim-powerline'
let g:Powerline_symbols = 'fancy'

"" Previously installed plugins:
"JavaScript-Indent
"VimClojure
"buffergator
"jshint.vim
"snipmate-snippets
"taglist
"tlib_vim
"vcscommand
"vim-addon-mw-utils
"vim-coffee-script
"vim-filesearch
"vim-liquid
"vim-markdown
"vim-markdown-jekyll
"vim-markdown-preview
"vim-snipmate
"vim-unimpaired

filetype plugin indent on     " required!

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

""""""""""""""""""""""
" Key bindings:

" Vim movement keys only
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>



""""""""""""""""""""""""
" Vim settings

set ruler 	  " Show line and col number

set hidden        " Hide buffers, don't close

set hlsearch      " Highlight the search term
set incsearch     " show search matches as you type

set nowrap        " don't wrap lines
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise

set showtabline=2 " Always show the tab header

" Tab settings
set tabstop=2
set shiftwidth=2
set expandtab
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

" No old-skool backups or swp files
set nobackup
set noswapfile

" Show trailing spaces
set list
set listchars=""
set listchars=tab:__
set listchars+=trail:.


" :Shell command: runs a shell command and dumps output to a scratch buffer.
" See http://vim.wikia.com/wiki/Display_output_of_shell_commands_in_new_window
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction


""" Autocommands """

" autocmd!     " reset all pre-existing autocmds
"autocmd VimEnter * NERDTree    " Open NERDTree on startup
""""""""""""""""""
" Configure coffeescript to be standard 2-space indents
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

