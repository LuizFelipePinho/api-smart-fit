<h1 align="center">API SmartFit</h1>
<p align="center">Esta é uma API REST que devolve informações sobre unidades da SmartFit.</p>

### Pré-requisitos

Antes de começar, você vai precisar ter instalado em sua máquina o [Docker](https://www.docker.com/). 
 Além disto é bom ter um editor para trabalhar com o código como [VSCode](https://code.visualstudio.com/)

### 🎲 Rodando a aplicação:

```bash
# Clone este repositório
$ git clone https://github.com/LuizFelipePinho/api-smart-fit.git

# Acesse a pasta do projeto no terminal/cmd
$ cd api-smart-fit

# Execute esse comando para criar os containers do Node, Mysql e suas dependências  
$ docker-compose up -d

# Faça a migração dos dados
$ docker container exec smartfit npm run migrate

# Crie os dados no banco de dados
$ docker container exec smartfit npm run seed

# O servidor iniciará na porta:3000 - acesse no navegador ou em qualquer software para teste de API o link http://localhost:3000/

```

### 🛠 Tecnologias

As seguintes ferramentas foram usadas na construção do projeto:

- [Docker](https://www.docker.com/)
- [Node.js](https://nodejs.org/en/)
- [Prisma](https://www.prisma.io/)
- [MySQL](https://www.mysql.com/)


### Autor
---

<a href="https://www.linkedin.com/in/luiz-felipe-pinho">
 <img style="border-radius: 50%;" src="https://avatars.githubusercontent.com/u/47011421?v=4" width="100px;" alt=""/>
 <br />
 <sub><b>Luiz Felipe Pinho</b></sub></a> <a href="https://blog.rocketseat.com.br/author/thiago//" title="Rocketseat">🚀</a>


Feito na força do ódio e paixão. 🦾❤️ 
