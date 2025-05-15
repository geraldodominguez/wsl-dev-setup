#!/bin/bash

set -e

echo "🔄 Atualizando o sistema..."
sudo apt update && sudo apt upgrade -y

echo "📦 Instalando ferramentas essenciais..."
sudo apt install -y build-essential software-properties-common apt-transport-https ca-certificates curl wget unzip gnupg lsb-release git nano zsh

echo "🐍 Instalando Python com pip e venv..."
sudo apt install -y python3 python3-pip python3-venv python3-dev

echo "🐚 Instalando e configurando Zsh + Oh My Zsh..."
chsh -s $(which zsh)
export RUNZSH=no
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "🎨 Instalando tema Powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' $HOME/.zshrc

echo "🔌 Ativando plugins úteis..."
sed -i 's/plugins=(.*)/plugins=(git sudo z docker)/' $HOME/.zshrc

echo "🌍 Instalando NVM (Node.js Version Manager)..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

echo "🛠️ Configurando NVM no .zshrc..."
cat << 'EOF' >> ~/.zshrc

# NVM config
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
EOF

export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"

echo "⬇️ Instalando Node.js LTS..."
nvm install --lts
nvm use --lts

echo "⚛️ Instalando ferramentas JS/React/NestJS..."
npm install -g create-react-app vite eslint prettier typescript @nestjs/cli

echo "🧪 Instalando utilitários extras..."
sudo apt install -y fzf bat htop jq tree ripgrep

echo "🐳 Instalando Docker Engine e Docker Compose..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo usermod -aG docker $USER

echo "🔐 Gerando chave SSH se ainda não existir..."
if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
  ssh-keygen -t ed25519 -C "seu@email.com" -f ~/.ssh/id_ed25519 -N ""
fi

echo "📝 Configurando o Git..."

# Solicita nome e e-mail do usuário
read -p "Digite seu nome completo para o Git: " git_name
read -p "Digite seu e-mail para o Git (o mesmo do GitHub): " git_email

git config --global user.name "$git_name"
git config --global user.email "$git_email"

# Ativa cores e editor padrão
git config --global color.ui auto
git config --global core.editor nano

# Cache de credenciais por 1 hora
git config --global credential.helper 'cache --timeout=3600'

# Alias úteis
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.cm commit
git config --global alias.st status
git config --global alias.last 'log -1 HEAD'

echo "✅ Git configurado com:"
git config --global --list

echo "🔐 Sua chave pública SSH (adicione no GitHub):"
cat ~/.ssh/id_ed25519.pub
echo "👉 Acesse: https://github.com/settings/keys"

echo "🧠 Ambiente preparado para o VS Code com WSL!"
echo "👉 Instale a extensão 'WSL' no VS Code e abra com: code ."
echo "👉 Recomendo extensões: ESLint, Prettier, Docker, Python, NestJS Snippets"

echo "✅ Instalação finalizada com sucesso!"
echo "👉 Rode 'exec zsh' ou reinicie o terminal"
echo "👉 Configure o visual com: p10k configure"
echo "👉 Comece um projeto com: nest new meuapp ou npx create-react-app meuapp"
