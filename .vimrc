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

"  Insert a line break without leaving command mode
" map <C-m> i<CR><Esc>h

" Add a new line in normal using Ctrl-J
" nnoremap <NL> i<CR><ESC>

nnoremap <leader>css :g#\({\n\)\@<=#.,/}/sort<cr>

map <silent> <C-q> bdw

" allow pattern matching with special characters
set magic
" :s/,/,^M/g
" To get the ^M character, type Control-v and hit Enter


syntax on

set synmaxcol=200
set t_Co=256
set background=dark
set termguicolors
let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"

colorscheme jellybeans-joel
" colorscheme grb256
" colorscheme darkburn
" colorscheme twilight256
" colorscheme twilight

" filetype plugin indent on
filetype plugin on


" set rtp+=/Users/jcarley/.vimbundles/powerline/powerline/bindings/vim
let g:airline_powerline_fonts = 1

" let g:airline_theme = 'jellybeans'
" let g:airline_theme = 'powerlineish'
" let g:airline_powerline_fonts = 0
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '◀'

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
au BufNewFile,BufRead *.ad,*.asciidoc,*.asc set filetype=asciidoc

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
let NERDTreeIgnore=['\.$', '\~$', '__pycache__']

let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" comment
nmap \\ <plug>NERDCommenterToggle<CR>
vmap \\ <plug>NERDCommenterToggle<CR>

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

"set clipboard=unnamed
set clipboard=unnamedplus
xnoremap p pgvy

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

" format xml in current buffer
map <leader>xf :%!xmllint --format -<cr> <leader><space> :noh<cr>

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

  " nnoremap <leader>a :Ag

  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:20,results:20'
  let g:ctrlp_tabpage_position = 'ac'

  map <leader>gn :CtrlP<cr>
  map <leader>gv :CtrlP app/views<cr>
  map <leader>gc :CtrlP app/controllers<cr>
  map <leader>gm :CtrlP app/models<cr>
  map <leader>gh :CtrlP app/helpers<cr>
  " map <leader>gd :CtrlP app/decorators<cr>
  map <leader>gi :CtrlP app/infrastructure<cr>
  map <leader>gl :CtrlP lib<cr>
  map <leader>gp :CtrlP public<cr>
  map <leader>gs :CtrlP public/stylesheets<cr>

  " shortcut for a new tab and Ag
  nmap <leader>n :call NewTabAndAg()<cr>
  function! NewTabAndAg()
    :tabnew
    :Ag
  endfunction
endif

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

" Switch from ruby 1.8 hash to ruby 1.9 hash
map <silent> <C-H> :%s/:\(\w*\)\s*=>\s*\(\w*\)/\1: \2/g<CR>

" let g:rspec_command = 'call Send_to_Tmux("zeus rspec {spec}\n")'
" let g:rspec_command = 'call Send_to_Tmux("be zeus rspec {spec}\n")'
let g:rspec_command = 'call Send_to_Tmux("bundle exec rspec {spec}\n")'
map <leader>t :call RunCurrentSpecFile()<CR>
map <leader>s :call RunNearestSpec()<CR>
map <leader>l :call RunLastSpec()<CR>
map <leader>a :call RunAllSpecs()<CR>


" React jsx support
let g:jsx_ext_required = 0

" vertical line indentation
let g:indentLine_color_term = 256
let g:indentLine_color_gui = '#5e5e5e'
let g:indentLine_char = '┆'

function! MakeRspecFileIfMissing()
ruby << EOF
  class MakesRspecFileIfMissing
    def self.for(buffer)
      if spec_file?(buffer) || already_exists?(spec_for_buffer(buffer))
        puts "Spec already exists"
        return
      end

      # puts "going to make #{directory_for_spec(buffer)}"
      # puts "going to make #{spec_for_buffer(buffer)}"
      system 'mkdir', '-p', directory_for_spec(buffer)
      File.open(spec_for_buffer(buffer), File::WRONLY|File::CREAT|File::EXCL) do |file|
        file.write "require 'spec_helper'"
      end
    end

    private
    def self.spec_file?(file)
      file.match(/.*_spec.rb$/)
    end

    def self.already_exists?(b)
      File.exists?(b)
    end

    def self.spec_for_buffer(b)
      spec_buffer = b.sub('/app/', '/spec/')
      spec_buffer.sub!('/lib/', '/spec/lib/')
      spec_buffer.sub!('.rb', '_spec.rb')
      return spec_buffer
    end

    def self.directory_for_spec(b)
      File.dirname(self.spec_for_buffer(b))
    end
  end
  buffer = VIM::Buffer.current.name
  MakesRspecFileIfMissing.for(buffer)
EOF
endfunction
" command! -nargs=0 MakeRspecFileIfMissing call MakeRspecFileIfMissing()
map <leader>grs :call MakeRspecFileIfMissing()<CR> :A<CR>

" abbreviations
iabbrev rmb require 'minitest/byebug'<Esc>F%s<c-o>:call getchar()<CR>
iab <expr> dts strftime('%Y-%m-%d')

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

