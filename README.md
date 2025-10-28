## 🧰 Script de Instalação para Conexão Remota usando OpenVPN

Este script automatiza a instalação e configuração das principais ferramentas necessárias para estabelecer conexões remotas seguras em sistemas Linux baseados em Debian ou Ubuntu.
Ele prepara o ambiente para acesso a redes e servidores via OpenVPN e RDP (Remote Desktop Protocol), utilizando o NetworkManager e o Remmina.

## Funcionalidades

**Atualização de Pacotes:**
Garante que a lista de pacotes e dependências do sistema estejam atualizados antes da instalação, assegurando versões recentes e estáveis.

**Instalação do OpenVPN:**
Instala o plugin NetworkManager-OpenVPN, permitindo configurar e gerenciar conexões VPN diretamente pela interface gráfica do sistema.

**Instalação do Remmina:**
Instala o Remmina, um cliente de desktop remoto completo que suporta múltiplos protocolos, como RDP, VNC, SSH e SFTP.

**Reinicialização do NetworkManager:**
Reinicia automaticamente o serviço para que o novo plugin OpenVPN seja reconhecido e carregado corretamente.

## Requisitos

Distribuição Linux baseada em Debian ou Ubuntu.

Permissões de superusuário (root) para executar instalações e reiniciar serviços.

Conexão com a internet ativa durante a execução do script.

## Como Utilizar

**Salve o Script:**
Copie o conteúdo e salve-o em um arquivo com a extensão .py, por exemplo:

instalar_ferramentas_remotas.py

**Abra o Terminal:**
Navegue até o diretório onde o arquivo foi salvo:
```bash
cd /caminho/para/o/arquivo
```

**Execute o Script como Root:**
Execute o comando abaixo para iniciar a instalação:
```bash
sudo python3 instalar_ferramentas_remotas.py
```

O script exibirá no terminal o progresso de cada etapa, além de mensagens de sucesso ou erro conforme a execução.

## Pós-instalação

Após a execução bem-sucedida:

**Configuração da VPN:**
Importe o arquivo de configuração (.ovpn) da sua rede diretamente no NetworkManager.

**Conexão Remota via Remmina:**
Abra o Remmina e crie uma nova conexão usando o protocolo RDP, VNC, SSH ou outro conforme sua necessidade.

### Dicas

Caso o NetworkManager não reconheça imediatamente o plugin OpenVPN, reinicie o sistema.

É recomendável testar a conexão VPN antes de configurar o acesso remoto via Remmina.

Para verificar se os pacotes foram instalados corretamente, utilize:

dpkg -l | grep openvpn
dpkg -l | grep remmina

**📜 Licença**

Este script é disponibilizado livremente para uso e modificação.
Use por sua conta e risco, sempre com as devidas permissões administrativas.