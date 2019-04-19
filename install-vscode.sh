#!/usr/bin/env bash

if ! command -v code &>/dev/null; then
  ln -s /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code /usr/local/bin/code
fi

code --install-extension dbaeumer.vscode-eslint
code --install-extension gerane.Theme-Jellybeams
code --install-extension ms-vscode.csharp
code --install-extension octref.vetur
code --install-extension PeterJausovec.vscode-docker
code --install-extension quicktype.quicktype
code --install-extension vscode-icons-team.vscode-icons
code --install-extension vscodevim.vim
