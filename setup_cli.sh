#!/bin/bash

echo -e "\033[32m [!] Setting up CLI configs [!]\033[0m"

# Set timezone
ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime && \
  dpkg-reconfigure --frontend noninteractive tzdata

# Set up oh-my-zsh
CHSH=yes RUNZSH=no KEEP_ZSHRC=yes sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended"

# Install powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

# Copy config files
cp ./zsh/.zshrc ~/.zshrc
cp ./zsh/.p10k.zsh ~/.p10k.zsh

# Change default shell to zsh
chsh --shell $(which zsh) $(whoami)