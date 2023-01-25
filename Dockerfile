FROM node:alpine

WORKDIR /app

COPY  package*.json ./

COPY prisma ./prisma/

COPY .env ./

COPY . . 

RUN npm install

RUN npm install -g prisma

RUN npx prisma generate

# RUN npm run migrate
ENTRYPOINT exec npx prisma migrate dev --name db-smart-api & npm start

# o desafio agora é fazer um seed, pode tentar alterar no .json o script de npm start
#  lembrando que o npm run seed funcionou dentro da cli do container igual o migrate dev

EXPOSE 3000

CMD ["npm", "start"]

