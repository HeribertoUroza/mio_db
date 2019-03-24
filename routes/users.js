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
userRouter.post('/', (req,res) => {
    // switched from username to email due to firebase and e-commerce
    const { email, firebase_uid , bio, profile_pic_url } = req.body;

    UserService.create(email, firebase_uid, bio, profile_pic_url )
        .then(data => {
            //res.json({data:data})
            res.json({
                message: `User has been created with the email: ${email}`
            })
        })
        .catch(err => {
            //res.json(err.toString())
            res.json({
                message: `Oops Something Went Wrong`
            })
        })

    // res.json({
    //     message: 'test'
    // })
})

// Read User



module.exports = userRouter;