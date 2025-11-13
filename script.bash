#!/bin/bash

#Script para configuração do ambiente Linux para VPN

sudoupdate () {
    att="sudo apt update && sudo apt upgrade -y"
    $att
    if [ "$att" -eq 1 ]; then #então
        echo "Erro ao atualizar o sistema. Tente novamente."
        erro= $?
        echo "Código de erro: $erro"
        return 1
    else
        echo "Atualização concluída com sucesso."
    fi #Em bash o "fi" fecha o "if"
}

instalar_openvpn () {
    echo "Iniciando a instalação do OpenVPN e Network Manager OpenVPN..."
    vpn="sudo apt install network-manager-openvpn -y"
    $vpn
    net="Killall -HUP NetworkManager"
    $net
    if [ $vpn -eq 0 ] and [ $net -eq 0 ]; then
        echo "OpenVPN e Network Manager instalados com sucesso."
    elif [ $vpn -ne 0 ]; then
        erro=$?
        echo "Houve um erro durante a instalação do OpenVPN."
        echo "Código de erro: $erro"
        return 1
    elif [ $net -ne 0 ]; then
        erro=$?
        echo "Houve um erro ao reiniciar o Network Manager."
        echo "Código de erro: $erro"
        return 1
    else
        erro=$?
        echo "Houve um erro durante a instalação do OpenVPN e Network Manager."
        echo "Código de erro: $erro"
        return 1
    fi
}

instalar_remmina() {
    echo "Iniciando a instalação do Remmina e plugins..."
    remmina="sudo apt install remmina remmina-plugin-rdp remmina-plugin-secret -y"
    $remmina
    if [ $remmina -eq 0 ]; then
        echo "Remmina e plugins instalados com sucesso."
    else
        erro=$?
        echo "Houve um erro durante a instalação do Remmina."
        echo "Código de erro: $erro"
        return 1
    fi
}


echo "Script Iniciado."
sudoupdate
instalar_openvpn
instalar_remmina
echo "Script Finalizado."