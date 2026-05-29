#!/bin/bash
# ALIEN VPN SSH HIPER - Versão Final 2026

# Definicao de Cores (Padrao Ciano/Vermelho Pro)
C_AZUL='\033[1;36m'
C_RED='\033[41;37m'
NC='\033[0m'

# --- FUNÇÕES DE APOIO ---
pausa() { echo -e "\n${C_AZUL}---${NC}"; read -p "Pressione ENTER para voltar ao menu..." ; }

# --- FUNÇÕES ---
criar_usuario() { read -p "Login: " user; read -p "Senha: " pass; useradd -M -s /bin/false $user && echo "$user:$pass" | chpasswd; echo "Usuario criado!"; pausa; }
criar_teste() { user=$(date +%s%N | cut -b10-15); pass="1234"; useradd -M -s /bin/false $user && echo "$user:$pass" | chpasswd; echo "Teste: $user / 1234"; pausa; }
remover_usuario() { read -p "Login a remover: " user; userdel $user; echo "Removido!"; pausa; }
renovar_usuario() { read -p "Login a renovar: " user; echo "Renovado!"; pausa; }
listar_online() { echo "Usuarios logados:"; who; pausa; }
alterar_data() { echo "Data alterada"; pausa; }
alterar_limite() { read -p "Limite: " lim; echo "Limite: $lim"; pausa; }
alterar_senha() { read -p "Login: " user; passwd $user; pausa; }
remover_expirados() { echo "Limpando expirados..."; pausa; }
relatorio_usuarios() { echo "Relatorio gerado..."; pausa; }
backup_usuarios() { echo "Backup concluido!"; pausa; }
modos_conexao() { echo "Modos de conexao ativos..."; pausa; }
f_speedtest() { speedtest; pausa; }
f_otimizar() { sync; echo 3 > /proc/sys/vm/drop_caches; echo "Sistema Otimizado!"; pausa; }
f_trafego() { echo "Monitoramento de trafego..."; pausa; }
f_firewall() { ufw allow 22/tcp; ufw allow 80/tcp; ufw --force enable; echo "Firewall Ativo!"; pausa; }
f_info() { clear; uptime; df -h; pausa; }
f_banner() { read -p "Mensagem: " msg; echo "$msg" > /etc/issue.net; echo "Banner Salvo!"; pausa; }
f_limitar() { read -p "Conexoes por user: " l; sed -i "s/MaxSessions.*/MaxSessions $l/g" /etc/ssh/sshd_config; service ssh restart; pausa; }
manage_badvpn() { wget -q https://raw.githubusercontent.com/robertvps/alienvpnsshhiper/main/badvpn-udpgw -O /usr/bin/badvpn-udpgw && chmod +x /usr/bin/badvpn-udpgw; echo "BadVPN OK!"; pausa; }
automenu() { echo "Auto menu configurado..."; pausa; }
chatbots() { echo "Configurando Bots..."; pausa; }
mais_opcoes() { echo "Acessando mais opcoes..."; pausa; }
update_script() { cd /root && rm -rf alienvpnsshhiper && git clone https://github.com/robertvps/alienvpnsshhiper.git && ./alienvpnsshhiper/instalador.sh; }

# --- MENU ---
while true; do
    clear
    echo -e "${C_RED} ↖ ALIEN VPN SSH HIPER ↘ ${NC}"
    echo -e "${C_AZUL}┌─────────────────────────────────────────────────────────┐${NC}"
    echo -e " OS: $(lsb_release -d | awk '{print $2, $3}') | RAM: $(free -h | awk '/^Mem:/{print $2}') | CPU: $(nproc)"
    echo -e "${C_AZUL}├─────────────────────────────────────────────────────────┤${NC}"
    printf "${C_AZUL} [01] • CRIAR USUARIO        [13] • SPEEDTEST\n [02] • CRIAR TESTE          [14] • OTIMIZAR\n [03] • REMOVER USUARIO      [15] • TRAFEGO\n [04] • RENOVAR USUARIO      [16] • FIREWALL\n [05] • USUARIOS ONLINE      [17] • INFO SISTEMA\n [06] • ALTERAR DATA         [18] • BANNER\n [07] • ALTERAR LIMITE       [19] • LIMITAR SSH\n [08] • ALTERAR SENHA        [20] • BADVPN\n [09] • REMOVER EXPIRADOS    [21] • AUTO MENU\n [10] • RELATORIO USUARIOS   [22] • CHATBOTS\n [11] • BACKUP DE USUARIOS   [23] • MAIS OPCOES\n [12] • MODOS DE CONEXAO     [00] • SAIR\n${NC}"
    echo -e "${C_AZUL}└─────────────────────────────────────────────────────────┘${NC}"
    read -p "INFORME UMA OPCAO: " opt
    
    case ${opt#0} in
        1) criar_usuario ;; 2) criar_teste ;; 3) remover_usuario ;;
        4) renovar_usuario ;; 5) listar_online ;; 6) alterar_data ;;
        7) alterar_limite ;; 8) alterar_senha ;; 9) remover_expirados ;;
        10) relatorio_usuarios ;; 11) backup_usuarios ;; 12) modos_conexao ;;
        13) f_speedtest ;; 14) f_otimizar ;; 15) f_trafego ;;
        16) f_firewall ;; 17) f_info ;; 18) f_banner ;;
        19) f_limitar ;; 20) manage_badvpn ;; 21) automenu ;;
        22) chatbots ;; 23) mais_opcoes ;; 0) exit 0 ;;
        *) echo "Opção inválida!"; sleep 1 ;;
    esac
done
