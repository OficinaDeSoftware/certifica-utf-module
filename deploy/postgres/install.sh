echo "Atualizando repositórios e pacotes..."

apt update && apt upgrade -y

echo "Instalando PostgreSQL e pacotes complementares..."

apt install -y postgresql postgresql-contrib

echo "Iniciando e habilitando o serviço do PostgreSQL..."

systemctl start postgresql
systemctl enable postgresql

DB_EMAIL_SENDER="ms_email"

echo "Criando o banco de dados '$DB_EMAIL_SENDER'..."
sudo -u postgres psql -c "CREATE DATABASE $DB_EMAIL_SENDER IF NOT EXISTS;"
