## Passos para rodar localmente
### Instale as dependências
````rb
bundle install
````
### Configure seu banco de dados PostgreSQL localmente
````rb
cp .env.local .env
````
### Crie e migre o banco de dados
````rb
rails db:create
rails db:migrate
````

### Execute o servidor
````rb
rails s
````
## Passos para rodar com Docker
### Copie as variáveis de ambiente
````rb
cp .env.docker .env
````
### Construa os contêineres e inicie o projeto
#### O.S.  Windows
````rb
docker-compose up --build -d
````
#### O.S.  Linux
````rb
sudo docker-compose up --build -d
````
### Crie e migre o banco de dados
#### O.S.  Windows
````rb
docker-compose run app rake db:create
docker-compose run app rake db:migrate
````
#### O.S.  Linux
````rb
sudo docker-compose run app rake db:create
sudo docker-compose run app rake db:migrate
````

