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
userRouter.get('/:firebase_uid' , ( req , res ) => {
    const { firebase_uid } = req.params;

    //res.json({id})
    UserService.read(firebase_uid )
    .then(data => {
        if(data.length === 0) {
            res.json({ message: `user doesnt exist` })
        }
        else res.json(data)
    })
    .catch(err => {
        res.json({
            message: err.toString()
        })
    })

})

userRouter.put('/:id', (req, res) => {
    const { username, email, bio, profile_pic_url } = req.body;
    const { id } = req.params;

    UserService.read(id)
        .then(data => {
            //res.json(data)
            UserService.update(id, username, email, bio, profile_pic_url)
                .then((data) => {
                    res.json({
                        success: `Username: ${username} updated.`,
                        data: data
                    });
                })
                .catch(err => {
                    res.json(err.toString());
                })
        })
        .catch(err => {
            res.json(err.toString())
        })
});

userRouter.delete('/:id' , ( req , res) => {
    const { id } = req.params;


    UserService.read(id)
        .then(data => {
            if (data.length === 0) {
                res.json({ message: `user doesnt exist` })
            }
            else UserService.delete(id)
                .then(data => {
                    res.json({
                        message: `User with ID: ${id} deleted`,
                        data: data

                    })
                })
                .catch(err => {
                    res.json({
                        message: err.toString()
                    })
                })
        })
        .catch(err => {
            res.json({
                message: err.toString()
            })
        })
})


module.exports = userRouter;