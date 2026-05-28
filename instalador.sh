#!/bin/bash

# ==============================================================================
# ALIEN VPN SSH PRO - SCRIPT DE INSTALAÇÃO AUTOMÁTICA
# Versão Consolidada - 2026
# ==============================================================================

# Definição de Cores
RED='\033[1;31m'; GREEN='\033[1;32m'; YELLOW='\033[1;33m'; BLUE='\033[1;34m'; CYAN='\033[1;36m'; MAGENTA='\033[1;35m'; WHITE='\033[1;37m'; BG_RED='\033[41m'; NC='\033[0m'

# --- [VISUAL VPS 2 - HEADER] ---
header() {
    clear
    local ram_total=$(free -h | awk '/Mem:/ {print $2}' | tr -d 'i')
    local cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')
    local onlines=$(who | wc -l)
    
    echo -e "${BLUE}┬────────────────────────────────────────────────────────────────────────┬${NC}"
    echo -e "${BLUE}│${BG_RED}${WHITE}                 ↖ ALIEN VPN SSH PRO MANAGER ↘                  ${NC}${BLUE}│${NC}"
    echo -e "${BLUE}├────────────────────────────────────────────────────────────────────────┤${NC}"
    printf "${BLUE}│${NC} %-23s ${BLUE}│${NC} %-23s ${BLUE}│${NC} %-21s ${BLUE}│${NC}\n" "SISTEMA" "MEMORIA RAM" "PROCESSADOR"
    printf "${BLUE}│${NC} OS: Ubuntu 22.04        ${BLUE}│${NC} Total: %-16s ${BLUE}│${NC} Uso: %-15s ${BLUE}│${NC}\n" "$ram_total" "$cpu_usage"
    echo -e "${BLUE}├────────────────────────────────────────────────────────────────────────┤${NC}"
    printf "${BLUE}│${NC} USUARIOS ONLINE: %-10s ${BLUE}│${NC} STATUS: ${GREEN}ONLINE${NC}               ${BLUE}│${NC}\n" "$onlines"
    echo -e "${BLUE}┴────────────────────────────────────────────────────────────────────────┴${NC}"
}

# --- [AQUI ENTRA TODO O TEU CÓDIGO ANTIGO] ---
# (Todas as tuas 22 funções originais estão aqui dentro)
# ... [INSERIR AQUI O BLOCO DE FUNÇÕES DO TEU ARQUIVO ORIGINAL] ...

# --- [MENU PRINCIPAL ESTILIZADO] ---
show_menu() {
    while true; do
        header
        echo -e " ${CYAN}📋 MENU PRINCIPAL - 23 OPÇÕES${NC}"
        echo -e " ──────────────────────────────────────────────────────────────"
        echo -e " ${GREEN}[01]${NC} Criar Conta SSH          ${GREEN}[02]${NC} Remover Conta SSH"
        echo -e " ${GREEN}[03]${NC} Listar Contas            ${GREEN}[04]${NC} Usuários Online"
        echo -e " ${GREEN}[05]${NC} Limitar Conexões         ${GREEN}[06]${NC} Definir Expiração"
        echo -e " ${GREEN}[07]${NC} BadVPN Manager           ${GREEN}[08]${NC} Squid Proxy"
        echo -e " ${GREEN}[09]${NC} OpenVPN Manager          ${MAGENTA}[10]${NC} Xray Core Manager ⭐"
        echo -e " ${GREEN}[11]${NC} V2Ray Manager            ${GREEN}[12]${NC} Hysteria 2 Manager"
        echo -e " ${GREEN}[13]${NC} Trojan-Go Manager        ${GREEN}[14]${NC} SlowDNS Manager"
        echo -e " ${GREEN}[15]${NC} WebSocket + TLS          ${GREEN}[16]${NC} BBR + Otimizações"
        echo -e " ${GREEN}[17]${NC} Firewall Manager         ${GREEN}[18]${NC} Monitoramento"
        echo -e " ${GREEN}[19]${NC} Atualizar Script         ${GREEN}[20]${NC} Backup Configs"
        echo -e " ${RED}[21]${NC} Uninstall All             ${GREEN}[22]${NC} Server Settings"
        echo -e " ──────────────────────────────────────────────────────────────"
        echo -e " ${RED}[00]${NC} Sair"
        echo ""
        read -p " 🔹 ESCOLHA UMA OPÇÃO [00-22]: " option
        
        case $option in
            01|1) create_ssh_user ;; 02|2) remove_ssh_user ;; 03|3) list_ssh_users ;; 04|4) show_online_users ;;
            05|5) limit_connections ;; 06|6) set_expiry ;; 07|7) manage_badvpn ;; 08|8) manage_squid ;;
            09|9) manage_openvpn ;; 10) manage_xray ;; 11) manage_v2ray ;; 12) manage_hysteria ;;
            13) manage_trojan_go ;; 14) manage_slowdns ;; 15) manage_wstls ;; 16) manage_bbr ;;
            17) manage_firewall_menu ;; 18) manage_monitoring ;; 19) update_script ;; 20) backup_configs ;;
            21) uninstall_all ;; 22) server_settings ;; 00|0) exit 0 ;;
            *) echo -e "${RED}Opção inválida!${NC}"; sleep 1 ;;
        esac
    done
}

# Iniciar o script
show_menu
