# Script de Instalação para Conexão Remota

Este script automatiza a instalação das ferramentas necessárias para estabelecer conexões remotas seguras em sistemas baseados em Debian/Ubuntu. Ele configura seu ambiente Linux para acesso a redes e servidores via **OpenVPN** e **RDP (Remote Desktop Protocol)**, utilizando o NetworkManager e o Remmina.

---

### Funcionalidades

* **Atualização de Pacotes:** Garante que a lista de pacotes do sistema esteja atualizada, permitindo a instalação das versões mais recentes das ferramentas.
* **Instalação do OpenVPN:** Instala o plugin do OpenVPN para o NetworkManager, facilitando a configuração e o gerenciamento de conexões VPN pela interface gráfica.
* **Instalação do Remmina:** Instala o **Remmina**, um cliente de desktop remoto versátil que suporta vários protocolos, incluindo RDP, VNC, SSH e SFTP.
* **Reinício do NetworkManager:** Reinicia o serviço do NetworkManager para que ele reconheça imediatamente o novo plugin do OpenVPN.

---

### Requisitos

* O script foi projetado para distribuições Linux baseadas em **Debian** ou **Ubuntu**.
* É necessário ter privilégios de **superusuário (root)** para executar as instalações.

---

### Como Usar

1.  **Salve o Script:**
    Salve o código em um arquivo com a extensão `.py`, por exemplo, `instalar_ferramentas_remotas.py`.

2.  **Abra o Terminal:**
    Navegue até o diretório onde você salvou o arquivo.

3.  **Execute o Script como Root:**
    Execute o script com o comando `sudo`:

    ```bash
    sudo python3 instalar_ferramentas_remotas.py
    ```

    O script fará todo o trabalho, exibindo o progresso e as mensagens de sucesso ou erro diretamente no terminal.

---

### Observações Adicionais

Após a execução do script, você precisará importar o arquivo de configuração (`.ovpn`) da sua rede no NetworkManager e configurar a nova conexão no Remmina para se conectar ao seu servidor remoto.