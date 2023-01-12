import { Prisma, PrismaClient } from '@prisma/client'
import express from 'express'

const prisma = new PrismaClient()
const app = express()

app.use(express.json())

app.get('/units', async (req, res) => {
 
  const units = await prisma.tb_unit.findMany({
  
    include: {
      tb_address: true,
      tb_situation: true,
      tb_schedules: {
        include: {
          tb_schedules: true,
        }
      },
      
    }
  })


  res.json(units)
})


const server = app.listen(3000, () =>
  console.log(`
🚀 Server ready at: http://localhost:3000
⭐️ See sample requests: http://pris.ly/e/ts/rest-express#3-using-the-rest-api`),
)