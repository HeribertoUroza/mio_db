const express = require('express');
const ProductsService = require('../services/productsS');

const productsRouter = express.Router();

// user_id INT NOT NULL,
//     title_product VARCHAR NOT NULL,
//         img_url VARCHAR NOT NULL,
//             amount INT,
//                 product_desc VARCHAR NOT NULL,


// Create Product
productsRouter.post('/', (req, res) => {
    
    const { user_id, username, firebase_uid,title_product, img_url, amount, product_desc } = req.body;

    ProductsService.create(user_id, username, firebase_uid,title_product, img_url, amount, product_desc)
        .then(data => {
            res.json({data:data})
            // res.json({
            //     message: `Post Created`
            // })
        })
        .catch(err => {
            //res.json(err.toString())
            res.status(400)
            res.json({
                message: `Oops Something Went Wrong`
            })
        })
})

//Read All Products

productsRouter.get('/all', (req, res) => {


    ProductsService.read()
        .then(data => {
            res.json({ data: data })
            // res.json({
            //     message: `Post Created`
            // })
        })
        .catch(err => {
            //res.json(err.toString())
            res.status(400)
            res.json({
                message: `Oops Something Went Wrong`
            })
        })
})

productsRouter.get('/byuser/:firebase_uid', (req, res) => {
    const { firebase_uid } = req.params
    ProductsService.readUserProducts(firebase_uid)
        .then(data => {
            res.json({ data: data })
            // res.json({
            //     message: `Post Created`
            // })
        })
        .catch(err => {
            //res.json(err.toString())
            res.status(400)
            res.json({
                message: `Oops Something Went Wrong`
            })
        })
})

module.exports = productsRouter;