FROM node:alpine

WORKDIR /app

COPY  package*.json ./

COPY prisma ./prisma/

COPY .env ./

COPY . . 

RUN npm install

RUN npm install -g prisma

RUN npx prisma generate

EXPOSE 3000

CMD ["npm", "start"]

