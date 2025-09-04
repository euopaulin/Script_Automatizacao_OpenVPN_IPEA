import os
import sys
import subprocess
import time

def atualizar_pacotes():
    if os.geteuid() != 0:
        print("Este script precisa ser executado como root. Por favor, use 'sudo su'.")
        return
    print('Inciando a instalação do OpenVPN...')
    
try:
    print('Atualizando a lista de pacotes...')
    subprocess.run(['apt-get', 'update', '-y'], check=True)
    print('Pacotes atualizados com sucesso.')
    
except subprocess.CalledProcessError as erro:
    print(f'Erro ao atualizar pacotes: {erro}')

def instalar_openvpn():
    try:
        print('Instalando o OpenVPN...')
        subprocess.run(['apt-get', 'install', 'network-manager-openvpn', '-y'], check=True)
        print('OpenVPN instalado com sucesso.')
        subprocess.run(['killall', '-HUP', 'NetworkManager'])
        print('NetworkManager reiniciado com sucesso.')
    except subprocess.CalledProcessError as erro1:
        print(f'Erro ao instalar OpenVPN: {erro1}')
        time.sleep(2)

def instalar_remmnina ():
    try:
        print('Instalando o Remmina...')
        subprocess.run(['apt-get', 'install', 'remmina', '-y'], check=True)
        print('Remmina instalado com sucesso.')
    except subprocess.CalledProcessError as erro2:
        print(f'Erro ao instalar Remmina: {erro2}')
        time.sleep(2)

atualizar_pacotes()
instalar_openvpn()
instalar_remmnina()

try:
    print('Script concluído com sucesso.')
    sys.exit(0)
except Exception as e:
    print(f'Ocorreu um erro inesperado: {e}')
    sys.exit(1)
    
