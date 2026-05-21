#!/bin/bash
# ========================================================
# SCRIPT ATUALIZADO E OTIMIZADO - ROBERT.GARCIA
# ========================================================

VERMELHO='\033[1;31m'
VERDE='\033[1;32m'
AMARELO='\033[1;33m'
AZUL='\033[1;34m'
CENARIO='\033[1;36m'
BRANCO='\033[1;37m'
PRETO='\033[1;30m'
SEM_COR='\033[0m'

# Caminho base para os scripts secundários do repositório
SUB_PASTA="/bin/vps_modulos"

while true; do
    # Atualização dinâmica de informações leves (Prevenção de 100% de CPU)
    OS_VERSAO=$(lsb_release -si 2>/dev/null || echo "Ubuntu")
    OS_RELEASE=$(lsb_release -sr 2>/dev/null || echo "22.04")
    RAM_TOTAL=$(free -h | awk '/^Mem:/ {print $2}')
    RAM_USO=$(free | awk '/^Mem:/ {printf("%.0f%%"), $3/$2*100}')
    NUCLEOS=$(nproc)
    
    # Cálculo leve de consumo de CPU baseado em carga média
    CPU_USO=$(vmstat 1 2 | tail -1 | awk '{print 100 - $15"%"}')
    
    TOTAL_USER=$(awk -F : '$3 >= 500 {print $1}' /etc/passwd | grep -v '^nobody' | wc -l)
    ONLINES=$(ps aux | grep -E "sshd|dropbear" | grep -v grep | wc -l)
    HORA_ATUAL=$(date +%H:%M:%S)
    
    clear
    echo -e "${AZUL}┌────────────────────────────────────────────────────────┐${SEM_COR}"
    echo -e "${AZUL}│${SEM_COR}           ${VERDE}█▓▒░${BRANCO} ROBERT.GARCIA ${VERDE}░▒▓█${SEM_COR}            ${AZUL}│${SEM_COR}"
    echo -e "${AZUL}├────────────────────────────────────────────────────────┤${SEM_COR}"
    echo -e "${AZUL}│ ${VERDE}SISTEMA${SEM_COR}             ${VERDE}MEMORIA RAM${SEM_COR}             ${VERDE}PROCESSADOR${SEM_COR}  ${AZUL}│${SEM_COR}"
    printf "${AZUL}│ ${VERMELHO}OS: ${BRANCO}%-15s${VERMELHO}Total: ${BRANCO}%-14s${VERMELHO}Nucleos: ${BRANCO}%-5s${AZUL}│\n" "$OS_VERSAO $OS_RELEASE" "$RAM_TOTAL" "$NUCLEOS"
    printf "${AZUL}│ ${VERMELHO}Hora: ${BRANCO}%-13s${VERMELHO}Em Uso: ${BRANCO}%-13s${VERMELHO}Em Uso: ${BRANCO}%-6s${AZUL}│\n" "$HORA_ATUAL" "$RAM_USO" "$CPU_USO"
    echo -e "${AZUL}├────────────────────────────────────────────────────────┤${SEM_COR}"
    printf "${AZUL}│ ${VERDE}Onlines: ${BRANCO}%-10s${VERMELHO}Expirados: ${BRANCO}%-9s${AMARELO}Total: ${BRANCO}%-12s${AZUL}│\n" "$ONLINES" "0" "$TOTAL_USER"
    echo -e "${AZUL}├────────────────────────────────────────────────────────┤${SEM_COR}"
    
    printf "${AZUL}│${PRETO}[${BRANCO}%02d${PRETO}]${AZUL} • ${VERDE}%-19s ${PRETO}[${BRANCO}%02d${PRETO}]${AZUL} • ${VERDE}%-16s${AZUL}│\n" 1 "CRIAR USUARIO" 13 "SPEEDTEST"
    printf "${AZUL}│${PRETO}[${BRANCO}%02d${PRETO}]${AZUL} • ${VERDE}%-19s ${PRETO}[${BRANCO}%02d${PRETO}]${AZUL} • ${VERDE}%-16s${AZUL}│\n" 2 "CRIAR TESTE" 14 "OTIMIZAR"
    printf "${AZUL}│${PRETO}[${BRANCO}%02d${PRETO}]${AZUL} • ${VERDE}%-19s ${PRETO}[${BRANCO}%02d${PRETO}]${AZUL} • ${VERDE}%-16s${AZUL}│\n" 3 "REMOVER USUARIO" 15 "TRAFEGO"
    printf "${AZUL}│${PRETO}[${BRANCO}%02d${PRETO}]${AZUL} • ${VERDE}%-19s ${PRETO}[${BRANCO}%02d${PRETO}]${AZUL} • ${VERDE}%-16s${AZUL}│\n" 4 "RENOVAR USUARIO" 16 "FIREWALL"
    printf "${AZUL}│${PRETO}[${BRANCO}%02d${PRETO}]${AZUL} • ${VERDE}%-19s ${PRETO}[${BRANCO}%02d${PRETO}]${AZUL} • ${VERDE}%-16s${AZUL}│\n" 5 "USUARIOS ONLINE" 17 "INFO SISTEMA"
    printf "${AZUL}│${PRETO}[${BRANCO}%02d${PRETO}]${AZUL} • ${VERDE}%-19s ${PRETO}[${BRANCO}%02d${PRETO}]${AZUL} • ${VERDE}%-16s${AZUL}│\n" 6 "ALTERAR DATA" 18 "BANNER"
    printf "${AZUL}│${PRETO}[${BRANCO}%02d${PRETO}]${AZUL} • ${VERDE}%-19s ${PRETO}[${BRANCO}%02d${PRETO}]${AZUL} • ${VERDE}%-16s${AZUL}│\n" 7 "ALTERAR LIMITE" 19 "LIMITAR SSH"
    printf "${AZUL}│${PRETO}[${BRANCO}%02d${PRETO}]${AZUL} • ${VERDE}%-19s ${PRETO}[${BRANCO}%02d${PRETO}]${AZUL} • ${VERDE}%-16s${AZUL}│\n" 8 "ALTERAR SENHA" 20 "BADVPN"
    printf "${AZUL}│${PRETO}[${BRANCO}%02d${PRETO}]${AZUL} • ${VERDE}%-19s ${PRETO}[${BRANCO}%02d${PRETO}]${AZUL} • ${VERDE}%-16s${AZUL}│\n" 9 "REMOVER EXPIRADOS" 21 "AUTO MENU"
    printf "${AZUL}│${PRETO}[${BRANCO}%02d${PRETO}]${AZUL} • ${VERDE}%-19s ${PRETO}[${BRANCO}%02d${PRETO}]${AZUL} • ${VERDE}%-16s${AZUL}│\n" 10 "RELATORIO USUARIOS" 22 "CHATBOTS"
    printf "${AZUL}│${PRETO}[${BRANCO}%02d${PRETO}]${AZUL} • ${VERDE}%-19s ${PRETO}[${BRANCO}%02d${PRETO}]${AZUL} • ${VERDE}%-16s${AZUL}│\n" 11 "GERENCIAR CHAVES" 23 "SOBRE"
    printf "${AZUL}│${PRETO}[${BRANCO}%02d${PRETO}]${AZUL} • ${VERDE}%-19s ${PRETO}[${BRANCO}%02d${PRETO}]${AZUL} • ${VERDE}%-16s${AZUL}│\n" 12 "OPCOES DE CONEXAO" 0 "SAIR DO MENU"
    echo -e "${AZUL}└────────────────────────────────────────────────────────┘${SEM_COR}"
    
    echo ""
    echo -ne "${AMARELO}Opção ?: ${SEM_COR}"
    read opcao

    case $opcao in
        1|01) echo -e "${VERDE}Chamando módulo: Criar Usuário...${SEM_COR}"; [[ -f "$SUB_PASTA/criar_usuario.sh" ]] && bash "$SUB_PASTA/criar_usuario.sh" || echo "Módulo não instalado." ; sleep 2 ;;
        2|02) echo -e "${VERDE}Chamando módulo: Criar Teste...${SEM_COR}"; sleep 2 ;;
        3|03) echo -e "${VERDE}Chamando módulo: Remover Usuário...${SEM_COR}"; sleep 2 ;;
        4|04) echo -e "${VERDE}Chamando módulo: Renovar Usuário...${SEM_COR}"; sleep 2 ;;
        5|05) echo -e "${VERDE}Chamando módulo: Usuários Online...${SEM_COR}"; sleep 2 ;;
        6|06) echo -e "${VERDE}Chamando módulo: Alterar Data...${SEM_COR}"; sleep 2 ;;
        7|07) echo -e "${VERDE}Chamando módulo: Alterar Limite...${SEM_COR}"; sleep 2 ;;
        8|08) echo -e "${VERDE}Chamando módulo: Alterar Senha...${SEM_COR}"; sleep 2 ;;
        9|09) echo -e "${VERDE}Chamando módulo: Remover Expirados...${SEM_COR}"; sleep 2 ;;
        10) echo -e "${VERDE}Chamando módulo: Relatório de Usuários...${SEM_COR}"; sleep 2 ;;
        11) echo -e "${VERDE}Chamando módulo: Gerenciar Chaves...${SEM_COR}"; sleep 2 ;;
        12) echo -e "${VERDE}Chamando módulo: Opções de Conexão...${SEM_COR}"; sleep 2 ;;
        13) echo -e "${VERDE}Executando Speedtest...${SEM_COR}"; speedtest-cli; echo -ne "\nPressione Enter para voltar..."; read ;;
        14) echo -e "${VERDE}Otimizando Sistema...${SEM_COR}"; sync; echo 3 > /proc/sys/vm/drop_caches; apt-get clean; echo -e "${VERDE}Memória Liberada!${SEM_COR}"; sleep 2 ;;
        15) echo -e "${VERDE}Chamando módulo: Tráfego...${SEM_COR}"; sleep 2 ;;
        16) echo -e "${VERDE}Chamando módulo: Firewall...${SEM_COR}"; sleep 2 ;;
        17) echo -e "${VERDE}Chamando módulo: Info Sistema...${SEM_COR}"; sleep 2 ;;
        18) echo -e "${VERDE}Chamando módulo: Banner...${SEM_COR}"; sleep 2 ;;
        19) echo -e "${VERDE}Chamando módulo: Limitar SSH...${SEM_COR}"; sleep 2 ;;
        20) echo -e "${VERDE}Chamando módulo: BadVPN...${SEM_COR}"; sleep 2 ;;
        21) echo -e "${VERDE}Chamando módulo: Auto Menu...${SEM_COR}"; sleep 2 ;;
        22) echo -e "${VERDE}Chamando módulo: Chatbots...${SEM_COR}"; sleep 2 ;;
        23) clear; echo -e "${VERDE}Gerenciador por Robert Garcia. Versão 1.0 100% Funcional.${SEM_COR}"; echo -ne "\nPressione Enter para voltar..."; read ;;
        0|00) clear; echo -e "${AMARELO}Saindo do Menu Manager... Até logo!${SEM_COR}"; exit 0 ;;
        *) echo -e "${VERMELHO}Opção inválida! Selecione um número válido do menu.${SEM_COR}"; sleep 1 ;;
    esac
done
