#!/usr/bin/env bash

homedir=${HOME}

# dotfiles directory
dotfiledir=${homedir}/dotmatrix

# list of files/folders to symlink in ${homedir}
files=".agignore .ctags .gemrc .gitconfig .gitignore .gitmessage .irbrc .ideavimrc .rspec .vimrc .vuerc .zshrc .zsh_aliases .vim"

# change to the dotfiles directory
echo "Changing to the ${dotfiledir} directory"
cd ${dotfiledir}

# create symlinks (will overwrite old dotfiles)
for file in ${files}; do
    echo "Creating symlink to $file in home directory."
    ln -sf ${dotfiledir}/${file} ${homedir}/${file}
done

# ln in init.config for neovim
mkdir -p ${HOME}/.config/nvim
ln -sf ${dotfiledir}/init.vim ${homedir}/.config/nvim/init.vim

echo "...done"
