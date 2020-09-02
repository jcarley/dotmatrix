## Setup:

1. git clone this project
2. cd <project directory>/bin/
3. run hlink
4. run vimbundles.sh

## Gotchas:

For git completion, make sure you've run `brew install bash-completion` and sourced ~/.bashrc

## Setup Effortless Ctags with Git

http://tbaggery.com/2011/08/08/effortless-ctags-with-git.html

## Installing Homebrew Zsh

1. brew install zsh
2. sudo dscl . -create /Users/\$USER UserShell /usr/local/bin/zsh
3. Confirm the install: dscl . -read /Users/\$USER UserShell

Sometimes when upgrade the OS, your shell will get reset. So check it. This
is done with item 3.

If your permissions get reset for the location that brew stores everything, you can fix it with the following command.

    `sudo chown -R $(whoami):admin /usr/local`

## Installing Homebrew MacVim

1. Install Xcode
2. Open Xcode and let it finish installing its components
3. xcode-select --install
4. sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
5. brew install macvim --with-lua --with-override-system-vim

## Installing and running ansible playbook

1. Install ansible and run ansible

   ```
   sudo apt update
   sudo apt install ansible -y
   cd ~/dotmatrix
   sudo ansible-playbook -c local -i localhost, local.yml
   ```

2. We could also access a playbook from github.  This would be handy for initial setup procedures.

   ```
   sudo ansible-pull -U https://github.com/<your_user_name>/ansible.git
   ```

