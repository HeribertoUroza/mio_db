DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS ratings CASCADE;
DROP TABLE IF EXISTS purchase_list CASCADE;

CREATE TABLE users 
(
    id SERIAL PRIMARY KEY,
    username VARCHAR NOT NULL UNIQUE,
    email VARCHAR NOT NULL UNIQUE,
    firebase_uid VARCHAR NOT NULL UNIQUE,
    bio VARCHAR,
    profile_pic_url VARCHAR,
    createdAt TIMESTAMP DEFAULT NOW(),
    updatedAt TIMESTAMP DEFAULT NOW()
);

CREATE TABLE products 
(
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    username VARCHAR NOT NULL,
    firebase_uid VARCHAR NOT NULL,
    title_product VARCHAR NOT NULL,
    img_url VARCHAR NOT NULL,
    amount INT,
    product_desc VARCHAR NOT NULL,
    createdAt TIMESTAMP DEFAULT NOW(),
    updatedAt TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id)
    REFERENCES users(id)
    ON DELETE CASCADE,
    FOREIGN KEY (username)
    REFERENCES users(username)
    ON DELETE CASCADE,
    FOREIGN KEY (firebase_uid)
    REFERENCES users(firebase_uid)
    ON DELETE CASCADE
);

CREATE TABLE ratings
(
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    rating_amount INT,
    comment VARCHAR NOT NULL,
    createdAt TIMESTAMP DEFAULT NOW(),
    updatedAt TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id)
    REFERENCES users(id)
    ON DELETE CASCADE,
    FOREIGN KEY (product_id)
    REFERENCES products(id)
    ON DELETE CASCADE
);

CREATE TABLE purchase_list
(
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    product_list INT,
    FOREIGN KEY (user_id)
    REFERENCES users(id)
    ON DELETE CASCADE
    
);

