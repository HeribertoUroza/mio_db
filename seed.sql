DROP DATABASE IF EXISTS mio;
CREATE DATABASE mio;

\c mio;

CREATE TABLE users 
(
    id SERIAL PRIMARY KEY,
    username VARCHAR NOT NULL UNIQUE,
    email VARCHAR NOT NULL UNIQUE,
    firebase_uid VARCHAR NOT NULL,
    bio VARCHAR,
    profile_pic_url VARCHAR,
    createdAt TIMESTAMP DEFAULT NOW(),
    updatedAt TIMESTAMP DEFAULT NOW()
);

CREATE TABLE products 
(
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    title_product VARCHAR NOT NULL,
    img_url VARCHAR NOT NULL,
    amount INT,
    product_desc VARCHAR NOT NULL,
    createdAt TIMESTAMP DEFAULT NOW(),
    updatedAt TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id)
    REFERENCES users(id)
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


INSERT INTO users
    (username, email, firebase_uid, bio, profile_pic_url)
VALUES
    ('user1','john@email.com', 'firebase_uid','johns bio', null ),
    ('user2','michelle@email.com','firebase_uid' , 'michelle bio', 'https://ca.slack-edge.com/TD416AWAE-UD3U8EFNX-c31fe5045e93-48' ),
    ('user3','me@email.com', 'firebase_uid','heri bio', 'https://ca.slack-edge.com/TD416AWAE-UD3U8EFNX-c31fe5045e93-48' ),
    ('user4','adfvafvfsdfvvf@email.com', 'firebase_uid', null, 'https://ca.slack-edge.com/TD416AWAE-UD3U8EFNX-c31fe5045e93-48' );

INSERT INTO products
    (user_id, title_product, img_url, amount, product_desc )
VALUES
    (1, 'Title 1', 'https://ca.slack-edge.com/TD416AWAE-UD3U8EFNX-c31fe5045e93-48', 999, 'this is a thing' ),
    (2, 'Title 2', 'https://ca.slack-edge.com/TD416AWAE-UD3U8EFNX-c31fe5045e93-48', 1212, 'this is another thing' ),
    (2, 'Title 3', 'https://ca.slack-edge.com/TD416AWAE-UD3U8EFNX-c31fe5045e93-48', 23, 'wut brah' ),
    (4, 'Title 4', 'https://ca.slack-edge.com/TD416AWAE-UD3U8EFNX-c31fe5045e93-48', 1, 'lol u want an desc????' );

INSERT INTO ratings
    (user_id, product_id, rating_amount, comment )
VALUES
    (1, 1, 5, 'comment 1'),
    (2, 1, 4, 'comment 2'),
    (2, 2, 3, 'comment 1'),
    (2, 2, 2, 'comment 2'),
    (4, 3, 1, 'comment 1'),
    (4, 3, 3, 'comment 2'),
    (4, 4, 5, 'comment 1'),
    (4, 4, 2, 'comment 2');
    
INSERT INTO purchase_list
    (user_id, product_id, product_list)
VALUES
    (1, 1, 1 ),
    (2, 2, 2),
    (2, 3, 0),
    (4, 4, 1);

