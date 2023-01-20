import { PrismaClient, Prisma } from "@prisma/client";
import { createRequire } from "node:module";
const require = createRequire(import.meta.url);
const prisma = new PrismaClient();
const tb_address = require("./tb_address.json")
const tb_schedules = require("./tb_schedules.json")
const tb_situation = require("./tb_situation.json")
const tb_unit = require("./tb_unit.json")
const tb_unit_schedules = require("./tb_unit_shedules.json")

async function main() {

  tb_address.forEach( async (address) => await prisma.tb_address.create({ data: address }))

  tb_schedules.forEach( async (schedule) => await prisma.tb_schedules.create({ data: schedule }) )

  tb_situation.forEach( async (situation) => await prisma.tb_situation.create( { data: situation } ))

  tb_unit.forEach( async (unit) => { await prisma.tb_unit.create({ data: unit })})

  tb_unit_schedules.forEach( async (unit_schedule) => await prisma.tb_unit_schedules.create({ data: unit_schedule}))
  

}

main()
  .then(async () => {
    await prisma.$disconnect();
  })
  .catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
    process.exit(1);
  });
