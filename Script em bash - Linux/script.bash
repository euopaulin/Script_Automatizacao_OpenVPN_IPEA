#!/bin/bash

#Script para configuração do ambiente Linux para VPN

attdosistema () {
    echo "Iniciando a atualização do sistema..."
    att="sudo apt update"
    att2="sudo apt upgrade -y"
    $att
    $att2
    if [ "$att" -eq 0 ] and [ "$att2" -eq 0 ]; then #então
        echo "Sistema atualizado com sucesso."
    elif [ "$att" -ne 0 ]; then
        echo "Não foi possível atualizar a lista de pacotes. Tente novamente."
        erro=$?
        echo "Código de erro: $erro"
        return 1
    elif [ "$att2" -ne 0 ]; then
        echo "Não foi possível atualizar os pacotes do sistema. Tente novamente."
        erro=$?
        echo "Código de erro: $erro"
        return 1
    else   
        echo "Não foi possível atualizar o sistema. Tente novamente."
        erro=$?
        echo "Código de erro: $erro"
        return 1
    fi #Em bash o "fi" fecha o "if"
}

instalar_openvpn () {
    echo "Iniciando a instalação do OpenVPN e Network Manager OpenVPN..."
    vpn="sudo apt install network-manager-openvpn -y"
    $vpn
    net="killall -HUP NetworkManager"
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
attdosistema
instalar_openvpn
instalar_remmina
echo "Script Finalizado."