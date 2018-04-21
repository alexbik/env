syntax on
set guifont=Ubuntu\ Mono\ 13
set hlsearch
set mouse=a
set nocp                    " 'compatible' is not set
set nomousehide
set nu
set showcmd
set tabpagemax=20
set tabstop=4
set wildignore=*.o,*~,*.la,*.*lo*,*.aux,*.d
set wildmenu
filetype plugin on          " plugins are enabled

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
au BufNewFile,BufRead *.pp set filetype=python

" Remove trailing spaces
autocmd BufWritePre * :%s/\s\+$//e
