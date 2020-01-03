#!/usr/bin/env bash

if ! command -v code &>/dev/null; then
  ln -s /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code /usr/local/bin/code
fi

code --install-extension dbaeumer.vscode-eslint
code --install-extension gerane.Theme-Jellybeams
code --install-extension quicktype.quicktype
code --install-extension vscode-icons-team.vscode-icons
code --install-extension vscodevim.vim
code --install-extension deerawan.vscode-dash
code --install-extension esbenp.prettier-vscode
code --install-extension formulahendry.code-runner
code --install-extension mauve.terraform
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-python.python
code --install-extension ms-vscode.go
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension octref.vetur
code --install-extension pkief.material-icon-theme
code --install-extension quicktype.quicktype
code --install-extension shd101wyy.markdown-preview-enhanced
