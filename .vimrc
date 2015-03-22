set nocompatible

" Enable syntax highlighting
syntax on
filetype plugin indent on
filetype plugin on
" and Completion = <ctrl-N>
set omnifunc=syntaxcomplete#Complete

"Color me fancy
colorscheme molokai

" run pathogen
execute pathogen#infect()

" Settings for jedi-vim
let g:jedi#completions_command = "<C-N>"
let g:jedi#documentation_command = ""
let g:jedi#popup_select_first = 1
" Add line numbers
set number
set ruler
set laststatus=2
" Set encoding
set encoding=utf-8
" set 256 color terminal
set t_Co=256
" Whitespace stuff
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
" Status line ...
set showcmd
set showmatch
set showmode

" Show trailing spaces and highlight hard tabs
set list listchars=tab:»·,trail:·

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Strip trailing whitespaces on each save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Search related settings
set incsearch
set hlsearch

" Map Ctrl+l to clear highlighted searches
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" Directories for swp files
set backupdir=~/.vimbackup
set directory=~/.vimbackup

" make uses real tabs
au FileType make set noexpandtab

" Erlang uses 4 spaces
au FileType erlang set softtabstop=4 tabstop=4 shiftwidth=4

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" ctrp custom ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.eunit$',
  \ 'file': '\.exe$\|\.so$\|\.dll\|\.beam$\|\.DS_Store$'
  \ }
