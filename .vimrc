runtime! autoload/pathogen.vim
if exists('g:loaded_pathogen')
  call pathogen#runtime_prepend_subdirectories(expand('~/.vimbundles'))
endif

let mapleader = ","
let g:mapleader = ","
let localleader = '\'

map ; :

noremap ;; ;

syntax on
set background=dark
filetype plugin indent on
" colorscheme railscasts
" colorscheme railscasts2
colorscheme darkburn
" colorscheme twilight256
" colorscheme twilight

if $TERM == '^\%(screen\|xterm-color\)$' && t_Co == 8
  set t_Co=256
endif

set autoindent
set backupdir=~/.vimbackupdir,~/tmp,~/,.
set directory=~/.vimbackupdir,~/tmp,~/,.
set expandtab
set filetype=sh
set guifont=Monaco:h16
set guioptions-=T guioptions-=e guioptions-=L guioptions-=r
set hlsearch
set ignorecase
set listchars=tab:⇀\ ,trail:␠
set matchpairs+=<:>
set modeline
set modelines=5
set number
set nowrap
set ruler
set shell=bash
set shiftwidth=2
set showmatch
set sts=2
set tabstop=2
set tildeop
set visualbell
set wildmenu
set wildmode=longest,list,full

au! BufRead,BufNewFile *.rb
au! BufRead,BufNewFile *.xml
au BufNewFile,BufRead *.scss set filetype=sass

" CocoaPods
au BufNewFile,BufRead Podfile,*.podspec      set filetype=ruby

augroup vimrc
  autocmd!
  autocmd GuiEnter * set columns=120 lines=70 number
augroup END

" Clean up XML files (visual mode)
vmap <silent> <leader>x :!tidy -qi -raw -xml<CR>:se filetype=xml<CR>

nnoremap <leader>a :Ack

"Ctags make the world a better place
""Based on code from https://github.com/spicycode/Vimlander-2-The-Quickening
" Add RebuildTagsFile function/command
function! s:RebuildTagsFile()
  silent !ctags -R --exclude=coverage --exclude=files --exclude=log --exclude=tmp --exclude=vendor *
endfunction
command! -nargs=0 RebuildTagsFile call s:RebuildTagsFile()

set tags=./tags;
map <Leader>rt :RebuildTagsFile<cr>

" Run rake from Rails files
autocmd User Rails nnoremap <buffer> <D-r> :<C-U>Rake<CR>
autocmd User Rails nnoremap <buffer> <D-R> :<C-U>.Rake<CR>

" find the current file
map <silent> <C-s> :NERDTree<CR>:wincmd l<CR>:NERDTreeFind<CR>
map <silent> <C-q> :NERDTreeClose<CR>

map <leader>dc :NERDTreeClose<cr>
map <leader>do :NERDTree<cr>
" Enable nice colors
let NERDChristmasTree = 1
" Make it easy to see where we are
let NERDTreeHighlightCursorline = 1
" Make bookmarks visible
let NERDTreeShowBookmarks = 1
" Show hidden files
let NERDTreeShowHidden = 0
" Don't hijack NETRW
" let NERDTreeHijackNetrw = 0
let NERDTreeHijackNetrw = 1
let NERDTreeIgnore=['\.$', '\~$']

" clear search
nmap <silent> ,/ :nohlsearch<CR>

" sudo save with w!!
cmap w!! w !sudo tee % >/dev/null

" comment
nmap \\ <plug>NERDCommenterToggle<CR>
vmap \\ <plug>NERDCommenterToggle<CR>

" navigate windows
map <silent> <C-h> :wincmd h<CR>
map <silent> <C-Left> :wincmd h<CR>
map <silent> <C-k> :wincmd k<CR>
map <silent> <C-Up> :wincmd k<CR>
map <silent> <C-j> :wincmd j<CR>
map <silent> <C-Down> :wincmd j<CR>
map <silent> <C-l> :wincmd l<CR>
map <silent> <C-Right> :wincmd l<CR>

map <silent> <C-Z> :retab<CR> :Trim<CR>

" bubble text
" map <C-H> x<Left>P
" map <C-L> xp
map <C-J> ddp
map <C-K> ddkP

" open tabs with command-<tab number>
map <silent> <D-1> :tabn 1<CR>
map <silent> <D-2> :tabn 2<CR>
map <silent> <D-3> :tabn 3<CR>
map <silent> <D-4> :tabn 4<CR>
map <silent> <D-5> :tabn 5<CR>
map <silent> <D-6> :tabn 6<CR>
map <silent> <D-7> :tabn 7<CR>
map <silent> <D-8> :tabn 8<CR>
map <silent> <D-9> :tabn 9<CR>

map <silent> <C-H> :%s/:\(\w*\)\s*=>\s*\(\w*\)/\1: \2/g<CR>

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
