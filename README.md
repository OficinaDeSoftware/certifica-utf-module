## Certifica UTF Module

`Esse projeto tem a finalidade de centralizar os repositórios / microsserviços que possuem alguma dependência e são necessários para a execução do back-end.`

### Inicializar workspace

Para o gerenciamento e administracao dos repositorios esta sendo utilizado o submodules do git.
Dessa maneira para criar o arquivo .gitmodules baseado nos forks dos projetos do desenvolvedor foi optado por criar um .bat

- Execução
```
./init-workspace <FORK_NAME>
```
Assim vai ser executado o clone de todos os projetos necessários.
Caso você não tenha o fork de algum desses projetos vai ocorrer erro.
Os projetos seram clonados na pasta `services`

### Variaveis de ambiente

Os projetos necessitam de variáveis de ambiente para algumas funcionalidades,
como por exemplo autenticação. Uma alternativa para simplificar a adição das variáveis de desenvolvimento
e a criação de um arquivo .env dentro do certifica-utf-module, passando assim esse arquivo na inicialização do compose ou diretamente.

- Exemplo

![Env](documentation/images/env.png)

- Essas variaveis estão definidas em cada projeto, todos os projetos se encontram listados no [CertificaUTF Architecture](https://github.com/OficinaDeSoftware/certifica-utf-architecture)

| Variável de Ambiente                | Descrição                                      | Exemplo                                                                  |
|--------------------------------------|------------------------------------------------|--------------------------------------------------------------------------|
| `FIREBASE_BUCKET`                    | Nome do bucket do Firebase Storage            | `meu-projeto.appspot.com`                                                |
| `FIREBASE_DOWNLOAD_URL`               | URL base para download de arquivos do Firebase | `https://firebasestorage.googleapis.com/v0/b/meu-projeto.appspot.com/o/` |
| `GOOGLE_CLOUD_STORAGE_CREDENTIALS`    | Credenciais do Google Cloud Storage           | `keys em base64`                                                         |
| `GOOGLE_CLIENTE_ID`                   | ID do Cliente do Google                       | `1234567890-abc123def456.apps.googleusercontent.com`                     |
| `MONGO_URL`                           | URL de conexão com o MongoDB                  | `mongodb://localhost:27017/meu-banco`                                    |
| `TOKEN_SECURITY_JWT`                   | Token de segurança para autenticação JWT      | `supersecreto123`                                                        |
| `UTFPR_BASEURL`                       | URL base dos serviços da UTFPR                | `https://coensapp.dv.utfpr.edu.br/siacoes/service`                       |
| `EUREKA_SERVER_URL`                   | URL do servidor Eureka para registro de serviços | `http://certifica-utf-service-registry:8761/eureka/`                     |
| `BROKER_EMAIL`                        | E-mail padrão do broker                       | `default.email`                                                          |
| `DB_PASSWORD`                         | Senha do banco de dados                       | `postgres`                                                               |
| `DB_URL`                              | URL de conexão com o banco de dados PostgreSQL | `jdbc:postgresql://postgres-17:5432/ms-email`                            |
| `DB_USERNAME`                         | Usuário do banco de dados                     | `postgres`                                                               |
| `MAIL_PASSWORD`                       | Senha de autenticação do e-mail               | `asdasd sdasd 123 das`                                                   |
| `MAIL_USERNAME`                       | E-mail do remetente                           | `email@example.com`                                                      |
| `RABITMQ_ADDRESS`                     | URL dos servidores RabbitMQ                   | `amqps://user:password@rabbitmq.example.com/vhost`                       |

### Docker compose

Se preferir executar os projetos com o docker, existe um arquivo docker-compose.yml dentro da pasta services,
ele utiliza os projetos locais para execução dentro dos containers.

- Execução

```
docker-compose up
```
### Links uteis

`Para mais detalhes da arquitetura e variaveis de ambiente visite`: https://github.com/OficinaDeSoftware/certifica-utf-architecture

