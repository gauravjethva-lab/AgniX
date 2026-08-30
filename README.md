# ⚡ AgniX — Metasploit Exploit Module Generator

**AgniX** is a command-line security research utility for generating and managing Metasploit-related module configurations in authorized penetration-testing and lab environments.

> **Version:** 1.0.0
> **Platform:** Kali Linux / Linux / Windows
> **Language:** Python 3
> **License:** MIT

---

## ⚠️ Security & Legal Disclaimer

AgniX is intended **only for authorized security testing, security research, CTFs, and controlled laboratory environments**.

Before using this project:

* Obtain explicit authorization before testing systems you do not own.
* Use it only against systems and environments where you have permission.
* Do not use it to gain unauthorized access.
* Follow responsible disclosure practices when security issues are discovered.
* Comply with all applicable laws and regulations.
* The author and contributors are not responsible for misuse of this software.

**You are responsible for your actions and for obtaining appropriate authorization.**

---

## ✨ Features

* Python-based CLI interface
* Virtual-environment friendly installation
* Metasploit-related module generation workflow
* Payload profile listing
* Encoder profile listing
* Command-specific help
* Structured generated-module output directory
* Cross-platform Python implementation
* Simple and extensible project structure
* Designed for authorized security-testing workflows

---

## 🖥️ Supported Platforms

| Platform                  | Support                      |
| ------------------------- | ---------------------------- |
| Kali Linux                | ✅                            |
| Debian/Ubuntu-based Linux | ✅                            |
| Other Linux distributions | ⚠️ Should work with Python 3 |
| Windows                   | ✅                            |
| macOS                     | ⚠️ Not specifically tested   |

---

# 📦 Requirements

Before installing AgniX, make sure you have:

* Python 3
* Git
* `python3-venv`
* Metasploit Framework where required by your authorized lab workflow

Check Python:

```bash
python3 --version
```

Check Git:

```bash
git --version
```

On Kali Linux, you can install the required Python environment tools with:

```bash
sudo apt update
sudo apt install python3 python3-venv python3-full git -y
```

---

# 🐉 Installation — Kali Linux

## 1. Clone the Repository

```bash
git clone https://github.com/gauravjethva-lab/AgniX.git
```

Enter the project directory:

```bash
cd AgniX
```

---

## 2. Create a Virtual Environment

Kali Linux protects its system-managed Python installation using **PEP 668**.

Create an isolated environment:

```bash
python3 -m venv .venv
```

---

## 3. Activate the Virtual Environment

```bash
source .venv/bin/activate
```

Your terminal should now show something similar to:

```text
(.venv) root@kali:~/AgniX#
```

---

## 4. Upgrade pip

```bash
python -m pip install --upgrade pip
```

---

## 5. Install Dependencies

```bash
python -m pip install -r requirements.txt
```

If the installation succeeds, you should see:

```text
Successfully installed ...
```

---

# 🪟 Installation — Windows

Open PowerShell:

```powershell
git clone https://github.com/gauravjethva-lab/AgniX.git
cd AgniX
```

Create the virtual environment:

```powershell
py -m venv .venv
```

Activate it:

```powershell
.venv\Scripts\activate
```

Upgrade pip:

```powershell
python -m pip install --upgrade pip
```

Install dependencies:

```powershell
python -m pip install -r requirements.txt
```

---

# ✅ Verify Installation

After activating the virtual environment:

```bash
python metasploit_exploit_generator.py -h
```

You should see the AgniX banner and available commands.

Example:

```text
usage: metasploit_exploit_generator.py [-h] {exploit,payload,list} ...

Professional Metasploit Exploit Module Generator
```

---

# 🧭 CLI Commands

AgniX currently exposes the following command groups:

```text
exploit
payload
list
```

View the main help:

```bash
python metasploit_exploit_generator.py -h
```

View command-specific help:

```bash
python metasploit_exploit_generator.py exploit -h
```

```bash
python metasploit_exploit_generator.py payload -h
```

```bash
python metasploit_exploit_generator.py list -h
```

---

# 📋 Listing Available Profiles

AgniX can display the payload profiles configured by the project:

```bash
python metasploit_exploit_generator.py list --payloads
```

It can also display configured encoder profiles:

```bash
python metasploit_exploit_generator.py list --encoders
```

These commands are useful for verifying that the application's configuration and CLI components are functioning correctly.

---

# 📁 Project Structure

A typical AgniX installation looks like:

```text
AgniX/
├── .venv/
├── generated_modules/
├── metasploit_exploit_generator.py
├── requirements.txt
├── README.md
├── LICENSE
└── QUICKSTART.md
```

### Important files

| File / Directory                  | Purpose                     |
| --------------------------------- | --------------------------- |
| `metasploit_exploit_generator.py` | Main CLI application        |
| `requirements.txt`                | Python dependencies         |
| `.venv/`                          | Isolated Python environment |
| `generated_modules/`              | Generated project output    |
| `README.md`                       | Project documentation       |
| `QUICKSTART.md`                   | Quick-start documentation   |
| `LICENSE`                         | Project license             |

---

# 🔄 Updating AgniX

If you cloned the repository using Git:

```bash
cd AgniX
git pull
```

Activate the environment:

```bash
source .venv/bin/activate
```

Update dependencies:

```bash
python -m pip install -r requirements.txt
```

---

# 🧹 Deactivate the Virtual Environment

When you're finished:

```bash
deactivate
```

To use AgniX again:

```bash
cd AgniX
source .venv/bin/activate
```

---

# 🛠️ Troubleshooting

## `externally-managed-environment`

If you see:

```text
error: externally-managed-environment
```

you are probably trying to install packages into Kali's system Python.

Use:

```bash
python3 -m venv .venv
source .venv/bin/activate
python -m pip install -r requirements.txt
```

Do **not** modify the system Python unnecessarily.

---

## `python3-venv` Missing

If this command fails:

```bash
python3 -m venv .venv
```

install:

```bash
sudo apt update
sudo apt install python3-venv python3-full -y
```

Then recreate the environment:

```bash
python3 -m venv .venv
```

---

## Script Not Found

If you receive:

```text
python: can't open file 'metasploit_exploit_generator.py'
```

check your current directory:

```bash
pwd
```

Then:

```bash
ls -la
```

You should be inside:

```text
AgniX/
```

If necessary:

```bash
cd /path/to/AgniX
```

---

## Check the Python Environment

Run:

```bash
which python
```

With the virtual environment activated, it should point to something similar to:

```text
/home/kali/AgniX/.venv/bin/python
```

Check pip:

```bash
python -m pip --version
```

---

# 🧪 Testing

Basic CLI verification:

```bash
python metasploit_exploit_generator.py -h
```

Test the available list options:

```bash
python metasploit_exploit_generator.py list -h
```

Test payload profile listing:

```bash
python metasploit_exploit_generator.py list --payloads
```

Test encoder profile listing:

```bash
python metasploit_exploit_generator.py list --encoders
```

These checks verify the basic CLI functionality without requiring you to run an actual security operation.

---

# 📤 Output

AgniX uses the following directory for generated project output:

```text
generated_modules/
```

The exact contents depend on the command and configuration used.

Do not execute generated security-testing artifacts against systems without explicit authorization.

---

# 🤝 Contributing

Contributions are welcome.

### 1. Fork the repository

```bash
git clone https://github.com/gauravjethva-lab/AgniX.git
cd AgniX
```

### 2. Create a feature branch

```bash
git checkout -b feature/your-feature
```

### 3. Make your changes

Follow the existing project structure and coding conventions.

### 4. Test your changes

At minimum:

```bash
python metasploit_exploit_generator.py -h
```

### 5. Commit your changes

```bash
git add .
git commit -m "feat: describe your change"
```

### 6. Push your branch

```bash
git push origin feature/your-feature
```

### 7. Open a Pull Request

Describe:

* What changed
* Why it changed
* How it was tested
* Any limitations or known issues

---

# 🐛 Reporting Bugs

If you find a bug, open a GitHub issue with:

1. Operating system
2. Python version
3. AgniX version
4. Command that produced the issue
5. Complete error message
6. Relevant configuration information

Repository issues:

[AgniX GitHub Issues](https://github.com/gauravjethva-lab/AgniX/issues?utm_source=chatgpt.com)

**Do not publish sensitive credentials, private information, or undisclosed vulnerabilities in public issues.**

---

# 📚 Documentation

Additional documentation can be placed in:

```text
QUICKSTART.md
```

For project-specific usage details, always refer to the help output:

```bash
python metasploit_exploit_generator.py -h
```

---

# 📜 License

AgniX is released under the **MIT License**.

See the `LICENSE` file for the complete license text.

---

# 🙏 Acknowledgments

AgniX builds upon concepts and tooling from the broader security research ecosystem.

Special thanks to:

* Metasploit Framework contributors
* Open-source security researchers
* Penetration-testing community
* Contributors to AgniX

---

# 📞 Project

**GitHub:** [gauravjethva-lab](https://github.com/gauravjethva-lab?utm_source=chatgpt.com)

**Repository:** [AgniX](https://github.com/gauravjethva-lab/AgniX?utm_source=chatgpt.com)

---

<div align="center">

### ⚡ AgniX

**Security Research • Authorized Testing • Open Source**

[⬆ Back to Top](#-agnix--metasploit-exploit-module-generator)

</div>
