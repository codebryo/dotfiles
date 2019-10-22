#!/bin/bash
#/ Usage: bin/quickstart.sh
#/ Quickstart my macbook

# sudo_askpass() {
#   if [ -n "$SUDO_ASKPASS" ]; then
#     sudo --askpass "$@"
#   else
#     sudo "$@"
#   fi
# }

# # Install Xcode
# if ! [ -f "/Library/Developer/CommandLineTools/usr/bin/git" ]
# then
#     echo "Installing Xcode Command Line Tools"
#     sudo_askpass xcode-select --install
#     echo "Asking for Xcode license confirmation:"
#     sudo_askpass xcodebuild -license
# fi

# # Install Homebrew
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# # Run brew bundle
# brew bundle --file ./../Brewfile

# # Install zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# sudo_askpass chsh -s $(which zsh)

# Run specific dot file installations
# 
# Move general dotfiles to their right home in user
files=( .zshrc .hyper.js )
for i in "${files[@]}"
do
    cp ../$i ~/$i
done
# VScode specific
cat ../vscode/extensions.txt |% { code --install-extension $_}
cp  ../vscode/settings.json $HOME/Library/Application Support/Code/User/settings.json
