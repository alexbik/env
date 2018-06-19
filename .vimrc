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
set statusline+=col:\ %c,

filetype plugin on          " plugins are enabled
filetype plugin indent on
let mapleader=","  " E.g. ',cc' to use nerdcommenter
set timeout timeoutlen=1500

" To move between windows
let i = 1
while i <= 9
  execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
  let i = i + 1
endwhile
" Current window, to use run
" set statusline=win:%{WindowNumber()}
function! WindowNumber()
  let str=tabpagewinnr(tabpagenr())
  return str
endfunction
nmap <leader>wn :set statusline=win:%{WindowNumber()}<CR>

" Vim-Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Create directory for plugins if it doesn't exist
if empty(glob('~/.vim/bundle'))
  silent !mkdir -p ~/.vim/bundle
endif
" Load plugins
call plug#begin('~/.vim/bundle')
Plug 'junegunn/vim-plug'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --{clang,go}-completer' }
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
call plug#end()

" ---------------------------------- "
" Configure TagBar
" ---------------------------------- "
nmap <F8> :TagbarToggle<CR>

" ---------------------------------- "
" Configure syntastic
" ---------------------------------- "
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
autocmd VimEnter * SyntasticToggleMode  " disable syntastic by default

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_echo_current_error = 0
let g:syntastic_python_checker_args='--rcfile ~/.pylintrc'

nmap <leader>sc :SyntasticCheck<CR>
nmap <leader>sr :SyntasticReset<CR>
nmap <leader>st :SyntasticToggle<CR>

" ---------------------------------- "
" Configure Ultisnip and YouCompleteMe
" ---------------------------------- "
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" ---------------------------------- "
" Configure YouCompleteMe
" ---------------------------------- "
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion = 1

" Change auto-completion selection key
inoremap <C-Space> <C-y>
" Goto definition with F3, <Ctrl>-o/i to go back/forward
map <F3> :YcmCompleter GoTo<CR>

set tabstop=2
set shiftwidth=2
set expandtab
hi Statement ctermfg=5
hi LineNr ctermfg=8

" Code folding, zM zR to fold/unfold all
set foldmethod=indent
set foldnestmax=2  " this way methods of classes are folded, but internal statements aren't
set foldlevelstart=20  " unfold everything in a new window
nnoremap <space> za
vnoremap <space> zf

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
let g:easytags_events = ['BufWritePost']
