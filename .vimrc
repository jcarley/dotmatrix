runtime! autoload/pathogen.vim
if exists('g:loaded_pathogen')
  call pathogen#runtime_prepend_subdirectories(expand('~/.vimbundles'))
  call pathogen#helptags()
endif

let mapleader = ","
let g:mapleader = ","
let localleader = '\'

map ; :

noremap ;; ;

syntax on
set t_Co=256
set background=dark
colorscheme jellybeans-joel
" colorscheme grb256
" colorscheme railscasts
" colorscheme railscasts2
" colorscheme darkburn
" colorscheme twilight256
" colorscheme twilight
filetype plugin indent on

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
set wildignore+=*.o,*.obj,.git,tmp/**,public/uploads/**

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

" run selection in bash
vmap <leader>rs :!bash <CR>

nnoremap <leader>a :Ag

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
map <silent> <leader>f :NERDTree<CR>:wincmd l<CR>:NERDTreeFind<CR>
" map <silent> <C-q> :NERDTreeClose<CR>

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

" Searching Stuff
" I prever very magic (\v) search behavior
nnoremap / /\v
vnoremap / /\v
set hlsearch "set hl search
set incsearch "set incsearch
set ignorecase "set ignore case for search
set smartcase "be case sensitive if search has cap letter
set gdefault " /g flag on :s substitutions to replace all matches in a line:
nnoremap <leader><space> :noh<cr>  " remove highlight from search matches

"Copy current Vim paste register to clipboard
map <F2> :PBCopy<cr>
"Toggle between paste and nopaste, shows which one is active
map <F3> :set paste!\|set paste?<cr>
set clipboard=unnamed
xnoremap p pgvy


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

" command-t mappings
map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>gd :CommandTFlush<cr>\|:CommandT app/decorators<cr>
map <leader>gi :CommandTFlush<cr>\|:CommandT app/infrastructure<cr>
map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
map <leader>gs :CommandTFlush<cr>\|:CommandT public/stylesheets<cr>

" shortcut to open new tab and CommandT
nmap <leader>gn :call NewTabAndCommandT()<cr>
function! NewTabAndCommandT()
  :tabnew
  :CommandT
endfunction

" shortcut for a new tab and Ag
nmap <leader>n :call NewTabAndAg()<cr>
function! NewTabAndAg()
  :tabnew
  :Ag
endfunction

" rails specific mappings
map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>

" switch between last two files
nnoremap <leader><leader> <c-^>

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
