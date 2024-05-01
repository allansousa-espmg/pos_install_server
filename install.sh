#!/bin/bash

# Atualizar o sistema
sudo apt update && sudo apt upgrade -y

# Instalar pacotes
sudo apt install zsh neovim neofetch micro bashtop exa curl wget tldr net-tools git curl wget cmatrix -y

# Configurar Zsh como shell padrão (opcional)
chsh -s $(which zsh)

# Instalar plugins para Neovim (opcional)
curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# Personalizar Zsh (opcional)
cp ~/.oh-my-zsh/themes/agnoster.zsh-theme ~/.zshrc

# Instalar plugins para Neovim (opcional)
vim ~/.config/nvim/init.vim

# Mensagem de finalização
echo "Atualização e instalação dos programas concluída!"
