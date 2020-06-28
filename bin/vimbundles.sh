mkdir -p ~/.vimbundles
cd ~/.vimbundles

get_bundle() {
  (
  if [ -d "$2" ]; then
    echo "Updating $1's $2"
    cd "$2"
    git pull --rebase
  else
    git clone "git://github.com/$1/$2.git"
  fi
  )
}

#####  The Core
get_bundle tpope        vim-pathogen
get_bundle jcarley      vim-colorschemes
get_bundle godlygeek    tabular
get_bundle rking        ag.vim
get_bundle tpope        vim-fugitive
get_bundle tpope        vim-markdown
get_bundle tpope        vim-surround
get_bundle vim-ruby     vim-ruby
get_bundle jcarley      vim-rspec
get_bundle jgdavey      tslime.vim
get_bundle kien         ctrlp.vim
get_bundle fatih        vim-go
get_bundle vim-airline  vim-airline
get_bundle Shougo       neocomplete.vim
get_bundle honza        dockerfile.vim
get_bundle Yggdroot     indentLine
get_bundle hashivim     vim-terraform
get_bundle scrooloose   nerdcommenter
get_bundle scrooloose   nerdtree
get_bundle buoto        gotests-vim
get_bundle vim-python   python-syntax
get_bundle tmhedberg    SimpylFold
get_bundle saltstack    salt-vim

get_bundle leafgarland  typescript-vim
get_bundle posva        vim-vue
get_bundle pangloss     vim-javascript
get_bundle leshill      vim-json
get_bundle mxw          vim-jsx

# MaxMEllon/vim-jsx-pretty
# peitalin/vim-jsx-typescript

##### Extra nice to haves
# get_bundle udalov       kotlin-vim
# get_bundle dbakker      vim-projectroot
# get_bundle hackhowtofaq vim-solargraph
# get_bundle tpope        vim-git
# get_bundle adamlowe     vim-slurper
# get_bundle duff         vim-bufonly
# get_bundle ervandew     supertab
# get_bundle gregsexton   gitv
# get_bundle jgdavey      vim-blockle
# get_bundle kchmck       vim-coffee-script
# get_bundle therubymug   vim-pyte
# get_bundle tpope        vim-rails
# get_bundle tpope        vim-abolish
# get_bundle tpope        vim-cucumber
# get_bundle tpope        vim-endwise
# get_bundle tpope        vim-ragtag
# get_bundle tpope        vim-repeat
# get_bundle tpope        vim-speeddating
# get_bundle tpope        vim-unimpaired
# get_bundle slim-template vim-slim
# get_bundle vim-scripts  bufkill.vim
# get_bundle wgibbs       vim-irblack
# get_bundle mortice      pbcopy.vim
# get_bundle puppetlabs   puppet-syntax-vim
# get_bundle skalnik      vim-vroom
# get_bundle kana         vim-textobj-user
# get_bundle elixir-lang  vim-elixir
# get_bundle andyl        vim-textobj-elixir
# get_bundle derekwyatt   vim-scala
# get_bundle octol        vim-cpp-enhanced-highlight
# get_bundle ElmCast      elm-vim


# NOT USED
# get_bundle powerline    powerline
# get_bundle ecomba       vim-ruby-refactoring
# get_bundle jelera       vim-javascript-syntax
# get_bundle SirVer       ultisnips
# get_bundle Raimondi     delimitMate
# get_bundle tpope        vim-haml

vim -c 'call pathogen#helptags()|q'

