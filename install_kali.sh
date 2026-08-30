#!/bin/bash

################################################################################
# Metasploit Exploit Generator - Kali Linux Installation Script
# Version: 1.0.0
# Compatibility: Kali Linux 2021+, Debian-based distros
################################################################################

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Banner
print_banner() {
    echo -e "${RED}"
    cat << "EOF"
╔══════════════════════════════════════════════════════════════╗
║  METASPLOIT EXPLOIT GENERATOR - KALI LINUX INSTALLER       ║
║  Version 1.0.0                                              ║
║  Professional Penetration Testing Tool                      ║
╚══════════════════════════════════════════════════════════════╝
EOF
    echo -e "${NC}"
}

# Check if running as root
check_root() {
    if [[ $EUID -ne 0 ]]; then
        echo -e "${YELLOW}[!] This script requires root privileges for system-wide installation${NC}"
        echo -e "${YELLOW}[*] Run with: sudo bash install_kali.sh${NC}"
        exit 1
    fi
}

# Check Kali Linux
check_kali() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        if [[ "$ID" != "kali" ]]; then
            echo -e "${YELLOW}[*] Not Kali Linux detected, but may work on Debian-based distros${NC}"
        fi
    fi
}

# Install dependencies
install_dependencies() {
    echo -e "${BLUE}[*] Checking and installing dependencies...${NC}"
    
    # Update package manager
    echo -e "${BLUE}[*] Updating package manager...${NC}"
    apt-get update -qq
    
    # Check Python3
    if ! command -v python3 &> /dev/null; then
        echo -e "${BLUE}[*] Installing Python3...${NC}"
        apt-get install -y python3 python3-pip python3-venv
    else
        echo -e "${GREEN}[+] Python3 already installed${NC}"
        python3 --version
    fi
    
    # Check pip
    if ! command -v pip3 &> /dev/null; then
        echo -e "${BLUE}[*] Installing pip3...${NC}"
        apt-get install -y python3-pip
    else
        echo -e "${GREEN}[+] pip3 already installed${NC}"
    fi
    
    # Check git (for future updates)
    if ! command -v git &> /dev/null; then
        echo -e "${BLUE}[*] Installing git...${NC}"
        apt-get install -y git
    else
        echo -e "${GREEN}[+] git already installed${NC}"
    fi
    
    # Check metasploit-framework (optional)
    if ! command -v msfconsole &> /dev/null; then
        echo -e "${YELLOW}[!] Metasploit Framework not installed (optional)${NC}"
        echo -e "${YELLOW}[*] Install with: sudo apt-get install metasploit-framework${NC}"
    else
        echo -e "${GREEN}[+] Metasploit Framework already installed${NC}"
        msfconsole --version | head -n 1
    fi
}

# Install Python dependencies
install_python_deps() {
    echo -e "${BLUE}[*] Installing Python dependencies...${NC}"
    pip3 install --upgrade pip setuptools wheel -q
    pip3 install colorama -q
    echo -e "${GREEN}[+] Python dependencies installed${NC}"
}

# Create installation directory
setup_installation() {
    INSTALL_DIR="/opt/metasploit-exploit-generator"
    
    echo -e "${BLUE}[*] Setting up installation directory...${NC}"
    
    # Create directory
    mkdir -p "$INSTALL_DIR"
    
    # Copy script
    cp metasploit_exploit_generator.py "$INSTALL_DIR/"
    chmod +x "$INSTALL_DIR/metasploit_exploit_generator.py"
    
    # Create symbolic link for easy access
    ln -sf "$INSTALL_DIR/metasploit_exploit_generator.py" /usr/local/bin/metasploit-gen
    
    echo -e "${GREEN}[+] Installation directory: $INSTALL_DIR${NC}"
}

# Create man page
create_manpage() {
    echo -e "${BLUE}[*] Creating manual page...${NC}"
    
    cat > /usr/share/man/man1/metasploit-gen.1 << 'EOF'
.TH METASPLOIT-GEN 1 "$(date +%Y)" "metasploit-gen 1.0.0" "User Commands"
.SH NAME
metasploit-gen \- Professional Metasploit Exploit Module Generator
.SH SYNOPSIS
.B metasploit-gen
[\fIOPTION\fR] [\fICOMMAND\fR] [\fIARGS\fR]
.SH DESCRIPTION
A command-line tool for generating custom Metasploit exploit modules with
evasion techniques, payload generation, and post-exploitation automation.
.SH COMMANDS
.TP
.B exploit
Generate custom Metasploit exploit modules
.TP
.B payload
Generate msfvenom payloads with various encoders
.TP
.B list
List available payloads and encoders
.SH EXAMPLES
.TP
Generate exploit module:
metasploit-gen exploit -n "Apache Struts2" -c CVE-2017-5645 -d "RCE via OGNL"
.TP
Generate Windows x64 payload:
metasploit-gen payload -t windows_x64 -l 192.168.1.100 -p 4444 -e shikata_ga_nai
.TP
List available payloads:
metasploit-gen list --payloads
.SH AUTHOR
Security Research Team
.SH LICENSE
MIT License
EOF
    
    chmod 644 /usr/share/man/man1/metasploit-gen.1
    mandb -q 2>/dev/null || true
    echo -e "${GREEN}[+] Manual page created${NC}"
}

# Create configuration directory
setup_config_dir() {
    CONFIG_DIR="$HOME/.config/metasploit-gen"
    mkdir -p "$CONFIG_DIR"
    
    cat > "$CONFIG_DIR/config.json" << 'EOF'
{
  "default_author": "Security Researcher",
  "default_target": "Windows",
  "default_output_format": "exe",
  "max_iterations": 10,
  "output_directory": "./generated_modules"
}
EOF
    
    echo -e "${GREEN}[+] Configuration directory: $CONFIG_DIR${NC}"
}

# Print usage
print_usage() {
    echo -e "${GREEN}"
    cat << "EOF"

╔════════════════════════════════════════════════════════════════╗
║  INSTALLATION COMPLETE!                                       ║
╚════════════════════════════════════════════════════════════════╝

QUICK START:
  metasploit-gen --help                  # Show help
  metasploit-gen list --payloads         # List all payloads
  metasploit-gen list --encoders         # List all encoders

GENERATE EXPLOIT:
  metasploit-gen exploit \
    -n "Apache Struts2" \
    -c CVE-2017-5645 \
    -d "RCE via OGNL injection"

GENERATE PAYLOAD:
  metasploit-gen payload \
    -t windows_x64 \
    -l 192.168.1.100 \
    -p 4444 \
    -e shikata_ga_nai

HELP:
  metasploit-gen --help
  man metasploit-gen

DOCUMENTATION:
  Installation dir: /opt/metasploit-exploit-generator
  Config dir:       ~/.config/metasploit-gen
  Output dir:       ./generated_modules (in working directory)

EOF
    echo -e "${NC}"
}

# Main installation flow
main() {
    print_banner
    
    echo -e "${BLUE}[*] Starting installation process...${NC}\n"
    
    check_root
    check_kali
    install_dependencies
    install_python_deps
    setup_installation
    create_manpage
    setup_config_dir
    
    echo -e "\n${GREEN}[+] Installation completed successfully!${NC}\n"
    print_usage
    
    echo -e "${YELLOW}[!] First run? Execute: metasploit-gen exploit --help${NC}\n"
}

# Run main installation
main

exit 0
