cat << 'EOF' > $HOME/Plus
#!/bin/bash
clear
[[ "$(whoami)" != "root" ]] && {
echo -e "\033[1;37m[\033[1;31mErro\033[1;37m] - você precisa executar como root\033[0m"
rm -f $HOME/Plus > /dev/null 2>&1; exit 0
}

_lnk=$(echo 'z1:y#x.5s0ul&p4hs$s.0a72d*n-e!v89e032:3r'| sed -e 's/[^a-z.]//ig'| rev)
_Ink=$(echo '/3×u3#s87r/l32o4×c1a×l1/83×l24×i0b×'|sed -e 's/[^a-z/]//ig')
_1nk=$(echo '/3×u3#s×87r/83×l2×4×i0b×'|sed -e 's/[^a-z/]//ig')

cd $HOME

function verif_key () {
chmod +x $_Ink/list > /dev/null 2>&1
[[ ! -e "$_Ink/list" ]] && {
echo -e "\n\033[1;31mKEY INVÁLIDA OU REPOSITÓRIO INDISPONÍVEL!\033[0m"
rm -rf $HOME/Plus > /dev/null 2>&1
exit 1
}
}

echo -e "\033[1;37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[38;5;118m       ⇱ 👽 ALIEN VPN SSH HIPER 👽 AGRADECE A PREFERENCIA ⇲             "
echo -e "\033[1;37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
echo -e "             \033[1;31mATENCAO! \033[1;37mESSE SCRIPT IRA !\033[0m"
echo ""
echo -e "\033[1;31m• \033[1;37mINSTALAR UM CONJUNTO DE SCRIPTS COMO FERRAMENTAS\033[0m"
echo -e "\033[1;37m  PARA O GERENCIAMENTO DE REDE, SISTEMA E USUARIOS\033[0m"
echo ""
echo -e "\033[1;32m• \033[1;32mDICA! \033[1;37mULTILIZE O TEMA DARK EM SEU TERMINAL PARA\033[0m"
echo -e "\033[1;37m  UMA MELHOR EXPERIÊNCIA E VISUALIZACAO DO MESMO!\033[0m"
echo ""
echo -e "\033[1;37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "         \033[1;37m • \033[1;32mDono: 👽 ALIEN VPN SSH HIPER 👽 \033[1;37m •           "
echo -e "\033[1;37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""

echo -ne "\033[38;5;118mENTER \033[1;37mpara continuar a \033[1;31mINSTALACAO : \033[0m"; read x
[[ $x = @(n|N) ]] && exit

echo -e "\n\033[1;33m[+] Verificando chaves de acesso no servidor...\033[0m"
rm -f $_Ink/list > /dev/null 2>&1
wget -P $_Ink https://raw.githubusercontent.com/zumgabutm/donomodderajuda/main/I/list > /dev/null 2>&1
verif_key

echo "/bin/menu" > /bin/h && chmod +x /bin/h > /dev/null 2>&1
rm -f versao* > /dev/null 2>&1
wget https://raw.githubusercontent.com/zumgabutm/donomodderajuda/main/versao > /dev/null 2>&1
wget https://iplogger.org/10BEq > /dev/null 2>&1
rm -f 2lHZ43 > /dev/null 2>&1

cd /bin/ > /dev/null 2>&1
rm -f v2raymanager botteste.sh > /dev/null 2>&1
wget https://raw.githubusercontent.com/zumgabutm/donomodderajuda/main/M/v2raymanager > /dev/null 2>&1
wget https://raw.githubusercontent.com/zumgabutm/donomodderajuda/main/M/botteste.sh >/dev/null 2>&1
chmod 777 v2raymanager botteste.sh > /dev/null 2>&1

mkdir -p $HOME/BOT >/dev/null 2>&1
cd $HOME/BOT
rm -f ShellBot.sh > /dev/null 2>&1
wget https://raw.githubusercontent.com/zumgabutm/donomodderajuda/main/I/ShellBot.sh >/dev/null 2>&1
chmod 777 ShellBot.sh >/dev/null 2>&1
cd $HOME

echo ""
[[ -f "$HOME/usuarios.db" ]] && {
clear
echo -e "\033[1;37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "                   \033[1;37m• \033[1;31mATENCAO \033[1;37m• "
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
mkdir -p /usr/share/.plus
echo "crz: $(date)" > /usr/share/.plus/.plus

echo -e "\033[1;32m[+] INSTALANDO DEPENDÊNCIAS PYTHON ESSENCIAIS...\033[0m"
apt install pip python3-pip uuid-runtime socat python3 -y > /dev/null 2>&1

_pacotes=("bc" "screen" "nano" "unzip" "lsof" "netstat" "net-tools" "dos2unix" "nload" "jq" "firewalld")
for _prog in ${_pacotes[@]}; do
echo -e "    -> Instalando ferramenta: $_prog"
apt install $_prog -y > /dev/null 2>&1
done

pip install speedtest-cli > /dev/null 2>&1

echo -e "\033[1;32m[+] CONFIGURANDO PORTAS E REGRAS DE FIREWALL...\033[0m"
sudo firewall-cmd --zone=public --permanent --add-port=80/tcp > /dev/null 2>&1
sudo firewall-cmd --zone=public --permanent --add-port=8989/tcp > /dev/null 2>&1
sudo firewall-cmd --zone=public --permanent --add-port=5454/tcp > /dev/null 2>&1
sudo firewall-cmd --zone=public --permanent --add-port=8888/tcp > /dev/null 2>&1
sudo firewall-cmd --zone=public --permanent --add-port=8080/tcp > /dev/null 2>&1
sudo firewall-cmd --zone=public --permanent --add-port=7300/udp > /dev/null 2>&1
sudo firewall-cmd --zone=public --permanent --add-port=443/tcp > /dev/null 2>&1
sudo firewall-cmd --reload > /dev/null 2>&1
[[ -f "/usr/sbin/ufw" ]] && { ufw allow 443/tcp; ufw allow 80/tcp; ufw allow 3128/tcp; ufw allow 8799/tcp; ufw allow 8080/tcp; } > /dev/null 2>&1

echo -e "\033[1;32m[+] SINCRONIZANDO SCRIPTS SECUNDÁRIOS...\033[0m"
bash $_Ink/list $_lnk $_Ink $_1nk $key > /dev/null 2>&1

clear
echo ""
cd $HOME

cat /dev/null > /root/.bashrc
echo "clear" >> /root/.bashrc
echo 'DATE=$(date +"%d-%m-%y")' >>/root/.bashrc
echo 'TIME=$(date +"%T")' >>/root/.bashrc
echo 'echo -e "\033[1;35m======================================\033[0m"' >>/root/.bashrc
echo 'echo -e "\033[1;36m       👽 ALIEN VPN SSH HIPER 👽              \033[0m"' >>/root/.bashrc
echo 'echo -e "\033[1;35m======================================\033[0m"' >>/root/.bashrc
echo 'echo -e "\033[1;32m NOME DO SERVIDOR : \033[38;5;196m$HOSTNAME"' >>/root/.bashrc
echo 'echo -e "\033[1;32m SERVIDOR LIGADO À : \033[1;31m$(uptime -p)"' >>/root/.bashrc
echo 'echo -e "\033[1;32m DATA : \033[1;31m$DATE"' >>/root/.bashrc
echo 'echo -e "\033[1;32m HORA : \033[1;31m$TIME"' >>/root/.bashrc
echo 'echo -e "\033[1;32m DIGITE : \033[1;31mmenu\033[1;37m"' >>/root/.bashrc
echo 'echo -e ""' >>/root/.bashrc

date=$(date '+%Y-%m-%d <> %H:%M:%S')
echo -e "\033[1;37m Servidor                          $date"
echo -e "\033[1;37m                INSTALACAO CONCLUIDA               \033[1;33m "
echo -e "\033[1;33mPARA INICIAR DIGITE: \033[1;36mmenu\033[1;33m E DÊ ENTER \033[0m"
echo -e "\033[1;37mMAIS INFORMACOES \033[1;31m(\033[1;36mTELEGRAM\033[1;31m)↓ \033[0m"
echo -e "\033[1;37m@👽 ALIEN VPN SSH HIPER 👽 \033[0m"

rm -f $HOME/Plus && cat /dev/null > ~/.bash_history && history -c
EOF
chmod +x $HOME/Plus
$HOME/Plus

