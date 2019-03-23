const express = require('express');
const UserService = require('../services/userS');

const userRouter = express.Router();

// app.js => app.use('/users', userRouter)

// -----------TESTING ROUTE
// userRouter.get('/', (req,res) => {
//     res.json({
//         message: 'test'
//     })
// })



module.exports = userRouter;