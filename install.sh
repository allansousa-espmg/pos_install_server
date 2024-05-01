#!/bin/bash

#####################################################################
# Nome: Allan Sousa
# Email: allan.sousa@esp.mg.gov.br
#
# Nome do programa: Pós-instalação Ubuntu Server 22.04LTS
# Versão: 0.2
# Descrição: Pós-instalação Ubuntu Server 22.04LTS com melhorias
#
# CHANGELOG:
# v0.2:
#   - Correção de bug na função `instalar_pacotes`.
#   - Adição de mensagem de erro para pacotes não encontrados.
#   - Adição de opções de personalização para o ZSH.
#   - Melhoria na formatação e legibilidade do código.
#####################################################################

# Funções

function atualizar_sistema() {
    echo "Atualizando o sistema..."
    echo "================================================================"
    sudo apt update -y && sudo apt upgrade -y || (echo "Erro ao atualizar o sistema!" && exit 1)
    sudo apt dist-upgrade -y || (echo "Erro ao atualizar o sistema!" && exit 1)
    sudo apt install ubuntu-restricted-extras -y || (echo "Erro ao instalar pacotes extras!" && exit 1)
    echo "Sistema atualizado com sucesso!"
}

function instalar_pacotes() {
    echo "Instalando pacotes básicos..."
    echo "================================================================"
    pacotes_basicos=(zsh neovim neofetch micro bashtop curl wget tldr net-tools git cmatrix)
    for pacote in "${pacotes_basicos[@]}"; do
        sudo apt install "$pacote" -y || (echo "Erro ao instalar o pacote $pacote!" && exit 1)
    done
    echo "Pacotes básicos instalados com sucesso!"
}

function configurar_zsh() {
    if [ -z "$1" ]; then
        echo "Informe o nome do usuário para configurar o ZSH:"
        read usuario
    else
        usuario="$1"
    fi

    echo "Configurando o ZSH para o usuário $usuario..."
    sudo chsh -s /usr/bin/zsh "$usuario" || (echo "Erro ao definir o ZSH como shell padrão!" && exit 1)

    echo "Deseja instalar o Oh My Zsh? (s/n)"
    read instalar_oh_my_zsh

    if [ $instalar_oh_my_zsh -eq "s" ]; then
        echo "Instalando o Oh My Zsh..."
        curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh || (echo "Erro ao instalar o Oh My Zsh!" && exit 1)
        echo "Oh My Zsh instalado com sucesso!"
    fi

    echo "ZSH configurado com sucesso para o usuário $usuario!"
}

function finalizar_instalacao() {
    echo "Finalizando a instalação..."
    echo "================================================================"
    sudo apt update && sudo apt dist-upgrade -y || (echo "Erro ao atualizar o sistema!" && exit 1)
    sudo apt autoclean -y
    sudo apt autoremove -y
    echo "Instalação finalizada com sucesso!"
    echo "================================================================"
    clear
}

# Execução das funções

atualizar_sistema
instalar_pacotes

# Configuração do ZSH (opcional)

echo "Deseja configurar o ZSH para um usuário específico? (s/n)"
read configurar_zsh_opcional

if [ $configurar_zsh_opcional -eq "s" ]; then
    configurar_zsh
else
    echo "O ZSH não será configurado neste momento."
fi

finalizar_instalacao
