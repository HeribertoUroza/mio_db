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


// Create User
userRouter.post('/', ( req , res ) => {
    const { username, email, firebase_uid , bio, profile_pic_url } = req.body;

    UserService.create(username, email, firebase_uid, bio, profile_pic_url )
        .then(data => {
            //res.json({data:data})
            res.status(200)
            res.json({
                message: `User: ${username} has been created with the email: ${email}`
            })
        })
        .catch(err => {
            //res.json(err.toString())
            res.status(400)
            res.json({
                message: `Oops Something Went Wrong`
            })
        })

    // res.json({
    //     message: 'test'
    // })
})

// Read User
userRouter.get('/:id' , ( req , res ) => {
    const { id } = req.params;

    //res.json({id})
    UserService.read( id )
    .then(data => {
        res.json(data)
    })
    .catch(err => {
        res.json(err.toString())
    })

})



module.exports = userRouter;