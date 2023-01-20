import { Prisma, PrismaClient } from "@prisma/client";
import express from "express";
const port = process.env.PORT || 3000;

const prisma = new PrismaClient();
const app = express();

app.use(express.json());

app.get("/units", async (req, res) => {
  const units = await prisma.tb_unit.findMany({
    include: {
      tb_address: true,
      tb_situation: true,
      tb_schedules: {
        include: {
          tb_schedules: true,
        },
      },
    },
  });

  res.json(units);
});

const server = app.listen(port, () =>
  console.log(`
🚀 Server ready at: http://localhost:${port}`)
);
