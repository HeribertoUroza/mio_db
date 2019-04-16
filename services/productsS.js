const { db } = require('./db')

const ProductsService = {};

ProductsService.create = (user_id, username, firebase_uid,title_product, img_url, amount, product_desc ) => {
    return db.none('INSERT INTO products (user_id,username, firebase_uid,title_product, img_url, amount, product_desc ) VALUES (${user_id},${username}, ${firebase_uid},${title_product}, ${img_url}, ${amount}, ${product_desc} )', { user_id, username, firebase_uid,title_product, img_url, amount, product_desc })
}

ProductsService.read = () => {
    return db.any('SELECT * FROM products')
}


ProductsService.readUserProducts = (firebase_uid) => {
    return db.any('SELECT * FROM products WHERE firebase_uid=${firebase_uid}', { firebase_uid})
}

module.exports = ProductsService