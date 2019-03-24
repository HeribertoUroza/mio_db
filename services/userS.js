const { db } = require('./db')

const UserService = {};


UserService.create = (username, email, firebase_uid, bio, profile_pic_url) => {
    return db.none('INSERT INTO users (username, email, firebase_uid, bio, profile_pic_url) VALUES (${username},${email}, ${firebase_uid}, ${bio}, ${profile_pic_url} )', {username, email , firebase_uid, bio, profile_pic_url})
}

UserService.read = (id) => {
    return db.any('SELECT * FROM users WHERE id=${id}', {id})
}

UserService.update = () => {

}

UserService.delete = () => {

}

module.exports = UserService;