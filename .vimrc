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
let g:jedi#popup_on_dot = 0
let g:jedi#force_py_version = 3
" Settings for vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_b = airline#section#create('%{virtualenv#statusline()}')
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
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79 completeopt-=preview

" when FileType is python <F9> runs the script :-)
au FileType python nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
au FileType python nnoremap <F8> :SyntasticCheck<cr>
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" own keybindings
nnoremap <F12> gT
nnoremap <F11> gt
nnoremap <F10> :tabnew<cr>
nnoremap <F4> :tabclose<cr>
" ctrp custom ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.eunit$',
  \ 'file': '\.exe$\|\.so$\|\.dll\|\.beam$\|\.DS_Store$'
  \ }
