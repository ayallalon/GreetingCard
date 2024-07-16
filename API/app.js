const connectDB = require('./database')
const express = require('express')
const app = express()
const port = 8000
const cors = require('cors')
const userRouter = require('./Routers/userRouter')
const cardRouter = require('./Routers/cardRouter')



app.use(express.json());
app.use(cors());


app.use('/User', userRouter)
app.use('/Card', cardRouter);



// connect db 
connectDB.connectDB()
//server
app.listen(port, ()=>{
    console.log(`Server is running on port ${port}`)
})
