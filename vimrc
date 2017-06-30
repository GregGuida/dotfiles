set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'mxw/vim-jsx'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'altercation/vim-colors-solarized'
Bundle 'derekwyatt/vim-scala'
Bundle 'plasticboy/vim-markdown'
Bundle 'joonty/vim-phpunitqf' 
Bundle 'buddhavs/vim-Rename'
Bundle 'joonty/vdebug.git'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'ervandew/supertab'
Bundle 'mattn/webapi-vim'
Bundle 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Bundle 'junegunn/fzf.vim'
" Bundle 'vim-phpcs'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
syntax enable
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set number
set history=1000                   " keeps a thousand lines of history
set magic                          " allows pattern matching with special characters
set backspace=2                    " make backspace work like normal
set visualbell                     " visual bell instead of annoying beeping
set mouse=a                        " enable full mouse support in the console
set virtualedit=onemore            " end of the line? what's that?
" smart, incremental case-insensitive search
set ignorecase
set smartcase
set incsearch

" Undo stuff!
set undofile

" Delete trailing space on save
autocmd BufWritePre *.php :%s/\s\+$//e
autocmd BufWritePre *.js :%s/\s\+$//e
autocmd BufWritePre *.css :%s/\s\+$//e
autocmd BufWritePre *.tpl :%s/\s\+$//e

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages = {'level': 'warnings'}

" let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_checkers = ['jsxhint']

nnoremap <C-t> :FZF<CR>
let &isfname="@,48-57,/,.,-,_,+,#,$,%,~"
set includeexpr=substitute(v:fname,'_','/','g')
set suffixesadd+=.php
set suffixesadd+=.tpl
set suffixesadd+=.mustache
set suffixesadd+=.js
set suffixesadd+=.jsx

"Make ctrlp index all the files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_max_files = 50000

" Create new directories when adding a file where the parent directory doesn't
" exist
function s:MkNonExDir(file, buf)
if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
let dir=fnamemodify(a:file, ':h')
if !isdirectory(dir)
            call mkdir(dir, 'p')
endif
endif
endfunction
augroup BWCCreateDir
autocmd!
autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
