DROP DATABASE IF EXISTS mio;
CREATE DATABASE mio;

\c mio;

CREATE TABLE users 
(
    id SERIAL PRIMARY KEY,
    username VARCHAR NOT NULL UNIQUE,
    email VARCHAR NOT NULL UNIQUE,
    bio VARCHAR NOT NULL,
    profile_pic_url VARCHAR,
    createdAt TIMESTAMP DEFAULT NOW(),
    updatedAt TIMESTAMP DEFAULT NOW()
);

CREATE TABLE products 
(
    id SERIAL PRIMARY KEY,
    seller_id INT REFERENCES users(id) NOT NULL,
    title_product VARCHAR NOT NULL,
    img_url VARCHAR NOT NULL,
    amount INT,
    product_desc VARCHAR NOT NULL,
    createdAt TIMESTAMP DEFAULT NOW(),
    updatedAt TIMESTAMP DEFAULT NOW()
);

CREATE TABLE ratings
(
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) NOT NULL,
    product_id INT REFERENCES products(id) NOT NULL,
    rating_amount INT,
    comment VARCHAR NOT NULL,
    createdAt TIMESTAMP DEFAULT NOW(),
    updatedAt TIMESTAMP DEFAULT NOW()
);

CREATE TABLE purchase_list
(
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) NOT NULL,
    product_id INT REFERENCES products(id) NOT NULL,
    product_list INT
    
);


INSERT INTO users
    (id,username, email, bio, profile_pic_url, createdAt, updatedAt)
VALUES
    (1, 'John', 'john@email.com', 'johns bio', 'https://ca.slack-edge.com/TD416AWAE-UD3U8EFNX-c31fe5045e93-48', NOW(), NOW() ),
    (2, 'Michelle', 'michelle@email.com', 'michelle bio', 'https://ca.slack-edge.com/TD416AWAE-UD3U8EFNX-c31fe5045e93-48', NOW(), NOW() ),
    (3, 'Heri', 'me@email.com', 'heri bio', 'https://ca.slack-edge.com/TD416AWAE-UD3U8EFNX-c31fe5045e93-48', NOW(), NOW() ),
    (4, 'Yerr', 'adfvafvfsdfvvf@email.com', 'yerr bio', 'https://ca.slack-edge.com/TD416AWAE-UD3U8EFNX-c31fe5045e93-48', NOW(), NOW() );

INSERT INTO products
    (id,seller_id, title_product, img_url, amount, product_desc, createdAt, updatedAt)
VALUES
    ( 1,1, 'Title 1', 'https://ca.slack-edge.com/TD416AWAE-UD3U8EFNX-c31fe5045e93-48', 999, 'this is a thing', NOW(), NOW() ),
    ( 2,2, 'Title 2', 'https://ca.slack-edge.com/TD416AWAE-UD3U8EFNX-c31fe5045e93-48', 1212, 'this is another thing' , NOW(), NOW() ),
    ( 3,2, 'Title 3', 'https://ca.slack-edge.com/TD416AWAE-UD3U8EFNX-c31fe5045e93-48', 23, 'wut brah', NOW(), NOW() ),
    ( 4,4, 'Title 4', 'https://ca.slack-edge.com/TD416AWAE-UD3U8EFNX-c31fe5045e93-48', 1, 'lol u want an desc????', NOW(), NOW() );

INSERT INTO ratings
    (id, user_id, product_id, rating_amount, comment, createdAt, updatedAt)
VALUES
    ( 1, 1, 1, 5, 'comment 1', NOW(), NOW() ),
    ( 2, 2, 1, 4, 'comment 2', NOW(), NOW() ),
    ( 3, 2, 2, 3, 'comment 1', NOW(), NOW() ),
    ( 4, 2, 2, 2, 'comment 2', NOW(), NOW() ),
    ( 5, 4, 3, 1, 'comment 1', NOW(), NOW() ),
    ( 6, 4, 3, 3, 'comment 2', NOW(), NOW() ),
    ( 7, 4, 4, 5, 'comment 1', NOW(), NOW() ),
    ( 8, 4, 4, 2, 'comment 2', NOW(), NOW() );
    
INSERT INTO purchase_list
    (id,user_id, product_id, product_list)
VALUES
    ( 1, 1, 1, 1 ),
    ( 2, 2, 2, 2),
    ( 3, 2, 3, 0),
    ( 4, 4, 4, 1);

