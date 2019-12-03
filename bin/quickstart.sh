#!/bin/zsh
#/ Usage: bin/quickstart.sh
#/ Quickstart my macbook

sudo_askpass() {
  if [ -n "$SUDO_ASKPASS" ]; then
    sudo --askpass "$@"
  else
    sudo "$@"
  fi
}

# Install Xcode
if ! [ -f "/Library/Developer/CommandLineTools/usr/bin/git" ]
then
    echo "Installing Xcode Command Line Tools"
    sudo_askpass xcode-select --install
    echo "Asking for Xcode license confirmation:"
    sudo_askpass xcodebuild -license
fi

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Run brew bundle
brew bundle --file ./Brewfile

#==================
# Dotfiles Specifics
#==================
# Move general dotfiles to their right home in user
files=( .zshrc .hyper.js )
for i in "${files[@]}"
do
    echo "Moving $i"
    cp ./$i ~/$i
done
# VScode specific
echo "Installing VScode extensions"
for e in $(cat ./vscode/extensions.txt)
do
    code --install-extension $e
done
echo "Moving VScode settings"
cp  vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json

#==================
# Install zsh
# -- Needs to be the final step as it prevents the script from running further
#==================
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo_askpass chsh -s $(which zsh)
# Add the pi theme
wget -O $ZSH_CUSTOM/themes/pi.zsh-theme https://raw.githubusercontent.com/tobyjamesthomas/pi/master/pi.zsh-theme
