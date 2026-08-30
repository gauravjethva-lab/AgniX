# 🎯 AgniX - Metasploit Exploit Module Generator

> **Professional Penetration Testing Tool** | Streamline custom Metasploit exploit development with advanced evasion techniques and automated payload workflows.

![Version](https://img.shields.io/badge/version-1.0.0-blue?style=flat-square)
![Python](https://img.shields.io/badge/python-3.7+-blue?style=flat-square)
![License](https://img.shields.io/badge/license-MIT-green?style=flat-square)
![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20Windows%20%7C%20macOS-orange?style=flat-square)

---

## 📖 Quick Navigation

- [Overview](#-overview)
- [Features](#-features)
- [Quick Start](#-quick-start)
- [Installation](#-installation)
- [Usage](#-usage)
- [System Requirements](#-system-requirements)
- [License](#-license)

---

## 🎯 Overview

**AgniX** is a professional-grade Metasploit exploit module generator designed for penetration testers, security researchers, and red teamers. It automates the creation of custom exploit modules, streamlines payload generation, and integrates advanced evasion techniques.

### Why AgniX?

- ⚡ **Generate exploit modules in seconds** - No manual Ruby coding required
- 🛡️ **Advanced evasion techniques** - Polymorphic, XOR, AES encoding
- 🎯 **Multi-platform support** - Windows (x86/x64), Linux, Android, Python, PHP
- 🔧 **Automated workflows** - Complete attack chain automation
- 📊 **Professional reporting** - Penetration test documentation
- 🚀 **Production-ready** - 1000+ lines of battle-tested code

---

## ✨ Features

### Core Capabilities

| Feature | Description | Status |
|---------|-------------|--------|
| **Custom Module Generation** | Auto-generate Ruby Metasploit modules | ✅ |
| **Payload Generation** | msfvenom integration for payload creation | ✅ |
| **Encoding/Evasion** | Polymorphic, XOR, AES, custom encoders | ✅ |
| **Listener Automation** | Auto-configure multi-handlers | ✅ |
| **Report Generation** | Professional penetration test reports | ✅ |
| **Cross-Platform** | Windows, Linux, macOS support | ✅ |
| **CLI Interface** | Professional command-line interface | ✅ |

### Supported Target Platforms

- 🪟 Windows (x86 & x64)
- 🐧 Linux (x86 & x64)
- 📱 Android
- 🐍 Python
- 🌐 PHP

---

## 🚀 Quick Start

### 1️⃣ Installation (60 seconds)

```bash
# Clone the repository
git clone https://github.com/gauravjethva-lab/AgniX.git
cd AgniX

# Install dependencies
pip install -r requirements.txt

# Run the tool
python3 metasploit_exploit_generator.py
```

### 2️⃣ Generate Your First Exploit

```bash
# Interactive mode (recommended for beginners)
python3 metasploit_exploit_generator.py

# Command-line mode
python3 metasploit_exploit_generator.py \
  --exploit-name "Custom RCE" \
  --target "Windows x64" \
  --payload "reverse_tcp" \
  --encoder "polymorphic"
```

### 3️⃣ Deploy in Metasploit

```bash
# Load module into Metasploit
msfconsole -r generated_modules/exploit.rc

# Or manually
msfconsole
> use exploit/windows/custom_rce
> set LHOST 192.168.1.100
> run
```

---

## 📦 Installation

### Prerequisites

- **Python 3.7+** 
- **pip** package manager
- **200 MB** disk space
- **Git** (for cloning)

### Option 1: Automated Installation (Recommended)

#### Kali Linux / Debian
```bash
git clone https://github.com/gauravjethva-lab/AgniX.git
cd AgniX
chmod +x install_kali.sh
sudo ./install_kali.sh
```

#### Windows
```batch
git clone https://github.com/gauravjethva-lab/AgniX.git
cd AgniX
install_windows.bat
```

#### macOS
```bash
git clone https://github.com/gauravjethva-lab/AgniX.git
cd AgniX
pip install -r requirements.txt
python3 metasploit_exploit_generator.py
```

### Option 2: Manual Installation

```bash
# Clone repository
git clone https://github.com/gauravjethva-lab/AgniX.git
cd AgniX

# Install dependencies
pip install -r requirements.txt

# Verify installation
python3 metasploit_exploit_generator.py --version
```

---

## 💻 Usage

### Command-Line Interface

```bash
python3 metasploit_exploit_generator.py [OPTIONS]
```

### Common Options
