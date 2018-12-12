execute pathogen#infect()
syntax on
set mouse=a
set number
set expandtab
set tabstop=2
set autoindent
set shiftwidth=2
set smarttab
set background=light
set wrap lbr
" To move one line when lines are wrapped
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
"inoremap <Down> <C-o>gj
"inoremap <Up> <C-o>gk

nnoremap <Home> g<Home>
nnoremap <End> g<End>
vnoremap <Home> g<Home>
vnoremap <End> g<End>
inoremap <Home> <C-o>g<Home>
inoremap <End> <C-o>g<End>

" To highlight searched words
set hlsearch
"" To let F3 toggle this option
nnoremap <F3> :set hlsearch!<CR>
nnoremap <F5> :windo o<CR>
nnoremap <F1> <NOP>
" Show a line at column 80 for PEP8 convention
set colorcolumn=80
highlight colorcolumn ctermbg=black guibg=gray
" Create the group EndlineSpaces, highlit in green
highlight EndlineSpaces ctermbg=darkgreen guibg=red
" Make folding indent specific:
set foldmethod=indent
set foldlevelstart=20
" Make trailing spaces belong to this group
" autocmd BufNewFile,BufRead * match EndlineSpaces /\s+$/
" Same, but will not highlight behind the cursor in insertion mode
autocmd BufNewFile,BufEnter,InsertLeave * match EndlineSpaces /\s\+\%#\@<!$/

" To redraw highlighting when exiting insert/edit mode
autocmd InsertLeave * redraw!
filetype on
filetype plugin on
filetype plugin indent on
" Reset some default values in pyflakes
autocmd FileType make setlocal noexpandtab
autocmd FileType python setlocal tabstop=2
autocmd FileType python setlocal softtabstop=2
autocmd FileType python setlocal shiftwidth=2

" Color cuh file like c files
autocmd BufNewFile,BufRead *.cuh set filetype=c
" Color comm file like Python files
autocmd BufNewFile,BufRead *.comm set filetype=python
" Color md files as markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown

" Color non breaking spaces (altgr+space)
highlight Nbspaces ctermbg=darkblue guibg=red
autocmd BufNewFile,BufEnter,InsertLeave * 2match Nbspaces / /

" For binary edition
function Toggle_hex()
  set binary!
  if &l:binary
    %!xxd
  else
    %!xxd -r
  endif
endfunction

nnoremap <C-h> :call Toggle_hex()<CR>

nnoremap <C-n> :lnext<CR>
nnoremap <C-b> :lprevious<CR>
nnoremap <C-j> :ALEToggle<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

"let g:ale_echo_cursor = 0
