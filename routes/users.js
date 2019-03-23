const express = require('express');
const UserService = require('../services/userS');

const userRouter = express.Router();

// app.js => app.use('/users', userRouter)

userRouter.get('/', (req,res) => {
    res.json({
        message: 'test'
    })
})

module.exports = userRouter;