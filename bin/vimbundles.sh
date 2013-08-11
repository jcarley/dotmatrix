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

get_bundle adamlowe     vim-slurper
# get_bundle altercation  vim-colors-solarized
get_bundle duff         vim-bufonly
get_bundle ervandew     supertab
get_bundle jcarley      vim-colorschemes
get_bundle godlygeek    tabular
get_bundle gregsexton   gitv
get_bundle jgdavey      vim-blockle
get_bundle jgdavey      vim-railscasts
# get_bundle jpo          vim-railscasts-theme
get_bundle kchmck       vim-coffee-script
get_bundle leshill      vim-json
# get_bundle mileszs      ack.vim
get_bundle rking        ag.vim
get_bundle pangloss     vim-javascript
get_bundle scrooloose   nerdcommenter
get_bundle scrooloose   nerdtree
get_bundle therubymug   vim-pyte
get_bundle tpope        vim-abolish
# get_bundle tpope        vim-bundler
get_bundle tpope        vim-cucumber
get_bundle tpope        vim-endwise
get_bundle tpope        vim-fugitive
get_bundle tpope        vim-git
get_bundle tpope        vim-haml
get_bundle bbommarito   vim-slim
get_bundle tpope        vim-markdown
get_bundle tpope        vim-pathogen
get_bundle tpope        vim-ragtag
get_bundle tpope        vim-rails
# get_bundle tpope        vim-rake
get_bundle tpope        vim-repeat
get_bundle tpope        vim-speeddating
get_bundle tpope        vim-surround
get_bundle tpope        vim-unimpaired
# get_bundle tpope        vim-vividchalk
# get_bundle msanders     cocoa.vim
get_bundle vim-ruby     vim-ruby
get_bundle vim-scripts  bufkill.vim
get_bundle wgibbs       vim-irblack
get_bundle mortice      pbcopy.vim
get_bundle puppetlabs   puppet-syntax-vim
# get_bundle wincent      Command-T
# get_bundle airblade     vim-gitgutter
get_bundle skalnik      vim-vroom
get_bundle jnwhiteh     vim-golang
get_bundle thoughtbot   vim-rspec
get_bundle jgdavey      tslime.vim
get_bundle kien         ctrlp.vim

vim -c 'call pathogen#helptags()|q'
