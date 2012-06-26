" Tab completion
function! Smart_TabComplete()
  let line = getline('.')                         " curline
  let substr = strpart(line, -1, col('.')+1)      " from start to cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction

inoremap <tab> <c-r>=Smart_TabComplete()<CR>

runtime! autoload/pathogen.vim
if exists('g:loaded_pathogen')
  call pathogen#runtime_prepend_subdirectories(expand('~/.vimbundles'))
endif

syntax on
filetype plugin indent on
colorscheme vividchalk

set autoindent
set background=dark
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

augroup vimrc
  autocmd!
  autocmd GuiEnter * set columns=120 lines=70 number
augroup END

" Clean up XML files (visual mode)
vmap <silent> <leader>x :!tidy -qi -raw -xml<CR>:se filetype=xml<CR>

" Run rake from Rails files
autocmd User Rails nnoremap <buffer> <D-r> :<C-U>Rake<CR>
autocmd User Rails nnoremap <buffer> <D-R> :<C-U>.Rake<CR>

" find the current file
map <silent> <C-s> :NERDTree<CR>:wincmd l<CR>:NERDTreeFind<CR>
map <silent> <C-q> :NERDTreeClose<CR>

" clear search
nmap <silent> ,/ :nohlsearch<CR>

" sudo save with w!!
cmap w!! w !sudo tee % >/dev/null

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
map <C-H> x<Left>P
map <C-L> xp
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

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
