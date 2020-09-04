#!/bin/sh
# Oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# Syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
mv ~/.zshrc ~/.zshrc-default
ln -s /home/vic/projects/config/.zshrc ~/.zshrc
ln -s /home/vic/projects/config/dadou.zsh-theme ~/.oh-my-zsh/custom/themes/
ln -s /home/vic/projects/config/mycnf ~/.oh-my-zsh/custom/plugins/
