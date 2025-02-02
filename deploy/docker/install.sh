DIR="/usr/sbin/docker-compose"

if [[ ! -e $DIR ]]; then

  echo "Installing Docker..."

  # Atualiza o sistema e instala pacotes necessários
  sudo apt update
  sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

  # Adiciona o repositório oficial do Docker
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-archive-keyring.gpg
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

  # Instala o Docker
  sudo apt update
  sudo apt install -y docker-ce docker-ce-cli containerd.io

  # Habilita e inicia o serviço do Docker
  sudo systemctl enable docker
  sudo systemctl start docker

  # Instala o Docker Compose
  sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose

  # Cria o link simbólico para facilitar o uso
  sudo ln -s /usr/local/bin/docker-compose /usr/sbin/docker-compose

fi
