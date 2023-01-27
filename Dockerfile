FROM node:16

WORKDIR /app

COPY  package*.json ./

COPY prisma ./prisma/

COPY .env ./

COPY . . 

RUN npm install

RUN npm install -g nodemon

RUN npm install --save-dev nodemon

RUN npm install -g prisma

RUN npx prisma generate

EXPOSE 3000

ENTRYPOINT npm migrate & npm start

# CMD ["npm", "start"]

