const { db } = require('./db')

const ProductsService = {};

ProductsService.create = (user_id, username, title_product, img_url, amount, product_desc ) => {
    return db.none('INSERT INTO products (user_id,username, title_product, img_url, amount, product_desc ) VALUES (${user_id},${username},${title_product}, ${img_url}, ${amount}, ${product_desc} )', { user_id, username, title_product, img_url, amount, product_desc })
}

ProductsService.read = () => {
    return db.any('SELECT * FROM products')
}

module.exports = ProductsService