# wsl-dev-setup
Script de configuração completo para ambientes de desenvolvimento no WSL com suporte a Python, JavaScript, React, NestJS, Docker e Git.
# 🚀 WSL Dev Setup

[![Instalar via Curl](https://img.shields.io/badge/Instalar%20via-curl-brightgreen?style=for-the-badge&logo=gnu-bash)](https://raw.githubusercontent.com/geraldodominguez/wsl-dev-setup/main/setup-dev.sh)
[![Licença MIT](https://img.shields.io/badge/licen%C3%A7a-MIT-blue.svg?style=for-the-badge)](LICENSE)

Script completo para configurar um ambiente de desenvolvimento moderno no **WSL Ubuntu 24.04**, com suporte a:

- 🐍 Python 3 + venv + pip
- ⚛️ React + TypeScript + Vite
- 🧱 NestJS (Node.js via NVM)
- 🐳 Docker + Compose
- 🐚 Zsh + Oh My Zsh + Powerlevel10k
- 🔐 Git com SSH, alias e configuração automática
- 🛠️ Ferramentas úteis: `fzf`, `bat`, `jq`, `htop`, `ripgrep`, `tree`

---

## 💻 Requisitos

- Windows 11 com WSL 2 ativado
- Ubuntu 22.04 ou 24.04 instalado via WSL
- Terminal com suporte a fonte Nerd Font (recomendado: [MesloLGS NF](https://github.com/ryanoasis/nerd-fonts))

---

## ⚙️ Instalação rápida

Execute no terminal WSL:

```bash
curl -s https://raw.githubusercontent.com/geraldodominguez/wsl-dev-setup/main/setup-dev.sh | bash
