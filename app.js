const express = require('express');
const bodyParser = require('body-parser')
const cors = require('cors')

const userRouter = require('./routes/users');
const productsRouter = require('./routes/products');


const app = express();

app.use(cors())


app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())

app.get('/ping', (req,res) => {
    res.json({
        message: '🏓 '
    })
})

app.use('/users', userRouter)
app.use('/products', productsRouter)

module.exports = { app, }