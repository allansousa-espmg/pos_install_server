#!/bin/bash

# Atualizar o sistema
sudo apt update && sudo apt upgrade -y

# Instalar pacotes
sudo apt install zsh neovim neofetch micro bashtop exa curl wget tldr net-tools git curl wget cmatrix -y

# Configurar Zsh como shell padrão (opcional)
chsh -s $(which zsh)

# Mensagem de finalização
echo "Atualização e instalação dos programas concluída!"
