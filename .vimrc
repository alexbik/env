syntax on
set guifont=Ubuntu\ Mono\ 13
set hlsearch
set mouse=a
set nocp                    " 'compatible' is not set
set nomousehide
set nu
set showcmd
set tabpagemax=20
set wildignore=*.o,*~,*.la,*.*lo*,*.aux,*.d
set wildmenu

filetype plugin on          " plugins are enabled
filetype plugin indent on

set tabstop=2
set shiftwidth=2
set expandtab
hi Statement ctermfg=5
hi LineNr ctermfg=8

augroup pythongroup
  autocmd!
  autocmd FileType python highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  autocmd FileType python match OverLength /\%81v.\+/
  autocmd FileType python set colorcolumn=80
augroup END
" filetype on
au FileType python setl sw=2 sts=2 et  " 2 spaces per tab

" Remove trailing spaces
autocmd BufWritePre * :%s/\s\+$//e

" ctags magic
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
