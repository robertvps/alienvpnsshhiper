#!/bin/bash
# ========================================================
# SEU MENU ORIGINAL COM CORES MODIFICADAS SOB MEDIDA
# PERSONALIZADO PARA: ROBERT.GARCIA
# ========================================================

# Definição das Cores Solicitadas
VERMELHO='\033[1;31m'
VERDE='\033[1;32m'
AMARELO='\033[1;33m'
AZUL='\033[1;34m'
CENARIO='\033[1;36m'
BRANCO='\033[1;37m'
PRETO='\033[0;30m' # Cor Preta para os Colchetes
SEM_COR='\033[0m'

# Dados do Sistema Originais
OS_VERSAO=$(lsb_release -si 2>/dev/null || echo "Ubuntu")
OS_RELEASE=$(lsb_release -sr 2>/dev/null || echo "20.04")
RAM_TOTAL=$(free -h | awk '/^Mem:/ {print $2}')
RAM_USO=$(free | awk '/^Mem:/ {printf("%.0f%%"), $3/$2*100}')
NUCLEOS=$(nproc)
CPU_USO=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-7.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')
TOTAL_USER=$(awk -F : '$3 >= 500 {print $1}' /etc/passwd | grep -v '^nobody' | wc -l)
ONLINES=$(ps aux | grep -E "sshd|dropbear" | grep -v grep | wc -l)

clear
while true; do
    HORA_ATUAL=$(date +%H:%M:%S)
    
    # Cabeçalho Ajustado com o seu Nome ROBERT.GARCIA e o fundo azul escuro
    echo -e "${AZUL}┌────────────────────────────────────────────────────────┐${SEM_COR}"
    echo -e "${AZUL}│${SEM_COR}          ${VERDE}█▓▒░${BRANCO} ROBERT.GARCIA ${VERDE}░▒▓█${SEM_COR}          ${AZUL}│${SEM_COR}"
    echo -e "${AZUL}├────────────────────────────────────────────────────────┤${SEM_COR}"
    echo -e "${AZUL}│ ${VERDE}SISTEMA${SEM_COR}             ${VERDE}MEMORIA RAM${SEM_COR}           ${VERDE}PROCESSADOR${SEM_COR}  ${AZUL}│${SEM_COR}"
    printf "${AZUL}│ ${VERMELHO}OS: ${BRANCO}%-15s${VERMELHO}Total: ${BRANCO}%-14s${VERMELHO}Nucleos: ${BRANCO}%-5s${AZUL}│\n" "$OS_VERSAO $OS_RELEASE" "$RAM_TOTAL" "$NUCLEOS"
    printf "${AZUL}│ ${VERMELHO}Hora: ${BRANCO}%-13s${VERMELHO}Em Uso: ${BRANCO}%-13s${VERMELHO}Em Uso: ${BRANCO}%-6s${AZUL}│\n" "$HORA_ATUAL" "$RAM_USO" "$CPU_USO"
    echo -e "${AZUL}├────────────────────────────────────────────────────────┤${SEM_COR}"
    printf "${AZUL}│ ${VERDE}Onlines: ${BRANCO}%-10s${VERMELHO}Expirados: ${BRANCO}%-9s${AMARELO}Total: ${BRANCO}%-12s${AZUL}│\n" "$ONLINES" "0" "$TOTAL_USER"
    echo -e "${AZUL}├────────────────────────────────────────────────────────┤${SEM_COR}"
    
    # OPÇÕES: Colchetes em PRETO e Números em BRANCO conforme você pediu
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
    printf "${AZUL}│${PRETO}[${BRANCO}%02d${PRETO}]${AZUL} • ${VERDE}%-19s ${PRETO}[${BRANCO}%02d${PRETO}]${AZUL} • ${VERDE}%-16s${AZUL}│\n" 11 "BACKUP DE USUARIOS" 23 "MAIS OPCOES"
    printf "${AZUL}│${PRETO}[${BRANCO}%02d${PRETO}]${AZUL} • ${VERDE}%-19s ${PRETO}[${BRANCO}%02d${PRETO}]${AZUL} • ${VERDE}%-16s${AZUL}│\n" 12 "MODOS DE CONEXAO" 0 "SAIR DO MENU"
    
    echo -e "${AZUL}└────────────────────────────────────────────────────────┘${SEM_COR}"
    echo ""
    echo -ne "${VERDE}INFORME UMA OPÇÃO: ${BRANCO}"
    read opcao

    # Mantendo os comandos exatos de fábrica do seu script original
    case $opcao in
        1|01) menu ;;
        2|02) criarteste ;;
        3|03) remover ;;
        4|04) renovar ;;
        5|05) onlines ;;
        6|06) alterardata ;;
        7|07) alterarlimite ;;
        8|08) alterarsenha ;;
        9|09) expirados ;;
        10) relatorio ;;
        11) backup ;;
        12) conexao ;;
        13) speedtest ;;
        14) otimizar ;;
        15) trafego ;;
        16) dados ;;
        17) nload ;;
        18) dados ;;
        19) dados ;;
        20) dados ;;
        21) dados ;;
        22) dados ;;
        23) dados ;;
        0|00) clear; exit 0 ;;
        *) echo -e "\n${VERMELHO}Opção Inválida!${SEM_COR}"; sleep 1 ;;
    esac
done
