#!/bin/bash
clear
# Link do seu repositório
URL_RAW="https://raw.githubusercontent.com/robertvps/robertvps/main"

echo -e "\033[1;32m[+] Baixando menu oficial...\033[0m"
# Baixa o menu e salva como /bin/menu
wget -O /bin/menu "$URL_RAW/instalar.sh" > /dev/null 2>&1
chmod +x /bin/menu
# Cria o atalho 'h'
echo "/bin/menu" > /bin/h && chmod +x /bin/h

echo -e "\033[1;32m[+] Instalação concluída!\033[0m"
echo -e "Digite \033[1;31mmenu\033[1;37m para abrir."
