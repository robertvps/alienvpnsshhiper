#!/bin/bash
VERDE='\033[1;32m'; AZUL='\033[1;34m'; BRANCO='\033[1;37m'; SEM_COR='\033[0m'; AMARELO='\033[1;33m'; VERMELHO='\033[1;31m'; PRETO='\033[1;30m'; BG_VERMELHO='\033[41;1;37m'

funcao_menu_xray() {
    while true; do
        clear
        echo -e "${AZUL}┌────────────────────────────────────────────────────────┐${SEM_COR}"
        echo -e "${AZUL}│${BG_VERMELHO}                GERENCIADOR XRAY (7 OP)                 ${SEM_COR}${AZUL}│${SEM_COR}"
        echo -e "${AZUL}├────────────────────────────────────────────────────────┤${SEM_COR}"
        for i in {01..07}; do printf "${AZUL}│${PRETO}[${BRANCO}$i${PRETO}]${AZUL} • ${VERDE}%-43s${AZUL}│\n" "FUNÇÃO $i"; done
        printf "${AZUL}│${PRETO}[${BRANCO}00${PRETO}]${AZUL} • ${VERDE}%-43s${AZUL}│\n" "VOLTAR AO MENU"
        echo -e "${AZUL}└────────────────────────────────────────────────────────┘${SEM_COR}"
        read -p "Opção: " sub_xray
        [[ "$sub_xray" == "0" || "$sub_xray" == "00" ]] && break
    done
}

while true; do
    clear
    echo -e "${AZUL}┌────────────────────────────────────────────────────────┐${SEM_COR}"
    echo -e "${AZUL}│${VERDE}             ROBERT.GARCIA MANAGER              ${AZUL}│${SEM_COR}"
    echo -e "${AZUL}└────────────────────────────────────────────────────────┘${SEM_COR}"
    echo -e "${AZUL}│${PRETO}[${BRANCO}11${PRETO}]${AZUL} • ${VERDE}GERENCIAR XRAY (7 OP)${AZUL}                       │"
    echo -e "${AZUL}│${PRETO}[${BRANCO}12${PRETO}]${AZUL} • ${VERDE}MODOS DE CONEXÃO      ${AZUL}                       │"
    echo -e "${AZUL}│${PRETO}[${BRANCO}00${PRETO}]${AZUL} • ${VERDE}SAIR                  ${AZUL}                       │"
    echo -e "${AZUL}└────────────────────────────────────────────────────────┘${SEM_COR}"
    read -p "Opção: " op
    case $op in
        11) funcao_menu_xray ;;
        12) 
            while true; do
                clear
                echo -e "${AZUL}┌────────────────────────────────────────────────────────┐${SEM_COR}"
                echo -e "${AZUL}│${VERMELHO}                MODOS DE CONEXÃO (7 FUNÇÕES)            ${AZUL}│${SEM_COR}"
                echo -e "${AZUL}├────────────────────────────────────────────────────────┤${SEM_COR}"
                printf "${AZUL}│${PRETO}[${BRANCO}01${PRETO}]${AZUL} • ${VERDE}%-19s ${PRETO}[${BRANCO}05${PRETO}]${AZUL} • ${VERDE}%-16s${AZUL}│\n" "OPENSSH" "SSL TUNNEL"
                printf "${AZUL}│${PRETO}[${BRANCO}02${PRETO}]${AZUL} • ${VERDE}%-19s ${PRETO}[${BRANCO}06${PRETO}]${AZUL} • ${VERDE}%-16s${AZUL}│\n" "DROPBEAR" "SSLH MULTI"
                printf "${AZUL}│${PRETO}[${BRANCO}03${PRETO}]${AZUL} • ${VERDE}%-19s ${PRETO}[${BRANCO}07${PRETO}]${AZUL} • ${VERDE}%-16s${AZUL}│\n" "OPENVPN" "WEBSOCKET"
                printf "${AZUL}│${PRETO}[${BRANCO}04${PRETO}]${AZUL} • ${VERDE}%-19s ${PRETO}[${BRANCO}00${PRETO}]${AZUL} • ${VERDE}%-16s${AZUL}│\n" "SQUID" "RETORNAR"
                echo -e "${AZUL}└────────────────────────────────────────────────────────┘${SEM_COR}"
                read -p "Opção: " sub_conexao
                [[ "$sub_conexao" == "0" || "$sub_conexao" == "00" ]] && break
            done
            ;;
        0|00) exit 0 ;;
    esac
done
