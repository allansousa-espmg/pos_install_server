#!/bin/bash

#####################################################################
# Nome: Allan Sousa
# Email: allan.sousa@esp.mg.gov.br
#
# Nome do programa: Pós-instalação Ubuntu Server 22.04LTS
# Versão: 0.1
# Descrição: Pós-instalação Ubuntu Server 22.04LTS
#
# CHANGELOG:
# v0.1:
#   - Adição de funções para modularização do código.
#   - Verificação de erros de instalação e comandos.
#   - Personalização da mensagem de boas-vindas.
#####################################################################

# Funções

function atualizar_sistema() {
  echo "Atualização do sistema"
  echo "================================================================"
  sudo apt update -y || exit 1
  sudo apt upgrade -y || exit 1
  sudo apt dist-upgrade -y || exit 1
  sudo apt install ubuntu-restricted-extras -y || exit 1
}

function instalar_pacotes() {
  echo "Instalação de pacotes"
  echo "================================================================"
  sudo apt install zsh neovim neofetch bashtop curl wget tldr net-tools git curl wget -y || exit 1
}

function finalizar_instalacao() {
  echo "Finalização, atualização e limpeza"
  echo "================================================================"
  sudo apt update && sudo apt dist-upgrade -y || exit 1
  sudo apt autoclean -y
  sudo apt autoremove -y
  echo "Fim da instalação"
  echo "================================================================"
  clear
}

atualizar_sistema

instalar_pacotes

# Instalar ZSH como shell padrão (opcional)

echo -n "Deseja instalar o ZSH como shell padrão? (s/n) "
read resposta

if [[ $resposta =~ ^[Ss]$ ]]; then
  sudo chsh -s /usr/bin/zsh $usuario
fi

finalizar_instalacao


