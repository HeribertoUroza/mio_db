DROP DATABASE IF EXISTS mio;
CREATE DATABASE mio;

\c mio;

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


INSERT INTO users
    (username, email, firebase_uid, bio, profile_pic_url)
VALUES
    ('user1','john@email.com', 'firebase_uid1','johns bio', null ),
    ('user2','michelle@email.com','firebase_uid2' , 'michelle bio', 'https://ca.slack-edge.com/TD416AWAE-UD3U8EFNX-c31fe5045e93-48' ),
    ('user3','me@email.com', 'firebase_uid3','heri bio', 'https://ca.slack-edge.com/TD416AWAE-UD3U8EFNX-c31fe5045e93-48' ),
    ('user4','adfvafvfsdfvvf@email.com', 'firebase_uid4', null, 'https://ca.slack-edge.com/TD416AWAE-UD3U8EFNX-c31fe5045e93-48' );

INSERT INTO products
    (user_id, username, firebase_uid,title_product, img_url, amount, product_desc )
VALUES
    (1, 'user1', 'firebase_uid1','Title 1', 'https://ca.slack-edge.com/TD416AWAE-UD3U8EFNX-c31fe5045e93-48', 999, 'this is a thing' ),
    (2, 'user2', 'firebase_uid2','Title 2', 'https://ca.slack-edge.com/TD416AWAE-UD3U8EFNX-c31fe5045e93-48', 1212, 'this is another thing' ),
    (2, 'user3', 'firebase_uid3','Title 3', 'https://ca.slack-edge.com/TD416AWAE-UD3U8EFNX-c31fe5045e93-48', 23, 'wut brah' ),
    (4, 'user4', 'firebase_uid4','Title 4', 'https://ca.slack-edge.com/TD416AWAE-UD3U8EFNX-c31fe5045e93-48', 1, 'lol u want an desc????' );

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

