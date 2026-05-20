cat << 'EOF' > $HOME/instalador.sh
#!/bin/bash
clear

# Configurações do seu Repositório (Onde o script vai se atualizar)
USUARIO_GITHUB="robertvps"
REPOSITORIO="robertvps"
BRANCH="main"
URL_RAW="https://raw.githubusercontent.com/$USUARIO_GITHUB/$REPOSITORIO/$BRANCH"

# Verificar se o usuário é root
[[ "$(whoami)" != "root" ]] && {
    echo -e "\033[1;37m[\033[1;31mErro\033[1;37m] - Você precisa executar como root\033[0m"
    rm -f $HOME/instalador.sh > /dev/null 2>&1; exit 0
}

cd $HOME

# ==========================================
# FUNÇÃO DE AUTO-ATUALIZAÇÃO
# ==========================================
_atualizar_script() {
    echo -e "\n\033[1;36m[+] Verificando atualizações no seu GitHub ($USUARIO_GITHUB)...\033[0m"
    
    # Baixa a versão mais recente do instalador do seu próprio github temporariamente
    wget -q -O $HOME/instalador.tmp "$URL_RAW/instalador.sh"
    
    if [ $? -eq 0 ] && [ -s $HOME/instalador.tmp ]; then
        mv $HOME/instalador.tmp $HOME/instalador.sh
        chmod +x $HOME/instalador.sh
        echo -e "\033[1;32m[+] O Script foi atualizado com sucesso para a última versão!\033[0m"
    else
        rm -f $HOME/instalador.tmp
        echo -e "\033[1;31m[-] Não foi possível buscar atualizações. Mantendo versão atual.\033[0m"
    fi
}

# Executa a checagem de atualização assim que inicia
_atualizar_script

# Tela de Boas-Vindas Personalizada
echo -e "\033[1;37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[38;5;118m        ⇱ GERENCIADOR ROBERT.VPS ATUALIZADO ⇲               "
echo -e "\033[1;37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
echo -e "               \033[1;32mINSTALADOR LEGÍTIMO E AUTÔNOMO\033[0m"
echo ""
echo -e "\033[1;31m• \033[1;37mInstalação de ferramentas de gerenciamento VPS\033[0m"
echo -e "\033[1;31m• \033[1;37mAuto-atualização via GitHub habilitada.\033[0m"
echo ""
echo -e "\033[1;37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""

echo -ne "\033[38;5;118mENTER \033[1;37mpara continuar a \033[1;31mINSTALAÇÃO : \033[0m"; read x
[[ $x = @(n|N) ]] && exit

# Sincronizando e baixando os menus principais do seu próprio repositório
echo -e "\n\033[1;33m[+] Baixando componentes do seu repositório...\033[0m"
cd /bin/ > /dev/null 2>&1

# Aqui ele baixa o seu menu visual (instalar.sh) e salva como 'menu'
wget -O /bin/menu "$URL_RAW/instalar.sh" > /dev/null 2>&1
chmod +x /bin/menu > /dev/null 2>&1

echo "/bin/menu" > /bin/h && chmod +x /bin/h > /dev/null 2>&1

cd $HOME

# Gerenciamento de Base de Dados Existente
[[ -f "$HOME/usuarios.db" ]] && {
    clear
    echo -e "\033[1;37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "                    \033[1;37m• \033[1;31mATENÇÃO \033[1;37m• "
    echo -e "\033[1;37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "\033[1;37mUma base de Dados de Usuários \033[1;32m(usuarios.db) \033[1;37mFoi Encontrada!\033[0m"
    echo -e "Deseja mantê-la preservando o limite de Conexões simultâneas?"
    echo -e "\033[1;37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "[\033[1;31m1\033[1;37m] Manter Base de Dados Atual"
    echo -e "[\033[1;31m2\033[1;37m] Criar uma Nova Base de Dados"
    echo -e "\033[1;37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo ""
    tput setaf 2 ; tput bold ; read -p "Opção ?: " -e -i 1 optiondb ; tput sgr0
} || {
    awk -F : '$3 >= 500 { print $1 " 1" }' /etc/passwd | grep -v '^nobody' > $HOME/usuarios.db
}

[[ "$optiondb" = '2' ]] && awk -F : '$3 >= 500 { print $1 " 1" }' /etc/passwd | grep -v '^nobody' > $HOME/usuarios.db

clear
echo -e "\033[1;32m[+] ATUALIZANDO O SISTEMA (Aguarde...)\033[0m"
apt-get update -y > /dev/null 2>&1
apt-get install lolcat figlet curl git boxes -y > /dev/null 2>&1

echo -e "\033[1;32m[+] INSTALANDO DEPENDÊNCIAS PYTHON ESSENCIAIS...\033[0m"
apt install pip python3-pip uuid-runtime socat python3 -y > /dev/null 2>&1

_pacotes=("bc" "screen" "nano" "unzip" "lsof" "netstat" "net-tools" "dos2unix" "nload" "jq" "firewalld")
for _prog in ${_pacotes[@]}; do
    echo -e "    -> Instalando ferramenta: $_prog"
    apt install $_prog -y > /dev/null 2>&1
done

pip install speedtest-cli > /dev/null 2>&1

echo -e "\033[1;32m[+] CONFIGURANDO PORTAS E REGRAS DE FIREWALL...\033[0m"
[[ -f "/usr/sbin/ufw" ]] && { ufw allow 443/tcp; ufw allow 80/tcp; ufw allow 3128/tcp; ufw allow 8799/tcp; ufw allow 8080/tcp; } > /dev/null 2>&1

clear
echo ""
cd $HOME

# Customizando o seu terminal (.bashrc) para exibir sua marca ao logar na VPS
cat /dev/null > /root/.bashrc
echo "clear" >> /root/.bashrc
echo 'DATE=$(date +"%d-%m-%y")' >>/root/.bashrc
echo 'TIME=$(date +"%T")' >>/root/.bashrc
echo 'echo -e "\033[1;35m======================================\033[0m"' >>/root/.bashrc
echo 'echo -e "\033[1;36m         ROBERT.VPS MANAGER           \033[0m"' >>/root/.bashrc
echo 'echo -e "\033[1;35m======================================\033[0m"' >>/root/.bashrc
echo 'echo -e "\033[1;32m NOME DO SERVIDOR : \033[38;5;196m$HOSTNAME"' >>/root/.bashrc
echo 'echo -e "\033[1;32m SERVIDOR LIGADO À : \033[1;31m$(uptime -p)"' >>/root/.bashrc
echo 'echo -e "\033[1;32m DATA : \033[1;31m$DATE"' >>/root/.bashrc
echo 'echo -e "\033[1;32m HORA : \033[1;31m$TIME"' >>/root/.bashrc
echo 'echo -e "\033[1;32m DIGITE : \033[1;31mmenu\033[1;37m"' >>/root/.bashrc
echo 'echo -e ""' >>/root/.bashrc

date=$(date '+%Y-%m-%d <> %H:%M:%S')
echo -e "\033[1;37m Servidor                           $date"
echo -e "\033[1;37m                INSTALACAO CONCLUIDA                \033[1;33m "
echo -e "\033[1;33mPARA INICIAR DIGITE: \033[1;36mmenu\033[1;33m E DÊ ENTER \033[0m"

rm -f $HOME/instalador.sh && cat /dev/null > ~/.bash_history && history -c
EOF
chmod +x $HOME/instalador.sh
$HOME/instalador.sh
