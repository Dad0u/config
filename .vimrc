execute pathogen#infect()
syntax on
set mouse=a
set number relativenumber
set expandtab
set tabstop=2
set autoindent
set shiftwidth=2
set smarttab
set background=light
set wrap lbr
autocmd FileType tex,text,plaintext setlocal tw=79
" Auto warp test to 80 characters without manually using gq}
autocmd FileType tex,text,plaintext setlocal fo=tcq
" To move one line when lines are wrapped
" nnoremap <Down> gj
" nnoremap <Up> gk
" vnoremap <Down> gj
" vnoremap <Up> gk
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
nnoremap <F3> :nohl<CR>
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
nnoremap <C-k> :lprevious<CR>
nnoremap <C-j> :ALEToggle<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

"let g:ale_echo_cursor = 0

" Remember folds and repoen them
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview


" Slime : to paste data in a screen
let g:slime_target = "screen"
let g:slime_default_config = {"sessionname": "ipy3", "windowname": "0"}
" For vim-slime to paste correctly in IPython
let g:slime_python_ipython = 1

" To select blocks easily (delimited by ##)
noremap <C-Down> /^##<CR>
noremap <C-Up> ?^##<CR>

" To execute the current block
map <C-c><C-x> ms/##<CR>VN<C-c><C-c>
" To execute the whole file
map <C-c><C-w> msggVG<C-c><C-c>


function CompileLatex()
  !(pdflatex % && bibtex %:r && pdflatex % && pdflatex %)
endfunction

noremap <F7> :call CompileLatex()<CR>
noremap <F8> :!make<CR>
noremap <F2> :set spell!<CR>

" Change misspelled word color
hi clear SpellBad
hi SpellBad ctermbg=3

" Blocks of more than one % or any block not starting with % or \
" (useful for latex)
set foldexpr=getline(v:lnum-1)=~'^%'&&getline(v:lnum)=~'^%'\|\|getline(v:lnum)=~'^[^%\\\\]'

let g:languagetool_jar = "/home/vic/projects/LanguageTool-4.9/languagetool-commandline.jar"
