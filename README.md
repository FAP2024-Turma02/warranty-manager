# Passos para rodar localmente
# Instale as dependências
bundle install

# Configure seu banco de dados PostgreSQL localmente
cp .env.local .env

# Crie e migre o banco de dados
rails db:create
rails db:migrate

# Execute o servidor
rails s

# ************************************************
# ************************************************


# Passos para rodar com Docker
# Copie as variáveis de ambiente
cp .env.docker .env

# Construa os contêineres e inicie o projeto
# O.S.  Windows
docker-compose up --build -d
# O.S.  Linux
sudo docker-compose up --build -d

# Crie e migre o banco de dados
# O.S.  Windows
docker-compose run app rake db:create
docker-compose run app rake db:migrate
# O.S.  Linux
sudo docker-compose run app rake db:create
sudo docker-compose run app rake db:migrate

