const { db } = require('./db')

const UserService = {};


UserService.create = (username, email, firebase_uid, bio, profile_pic_url) => {
    return db.none('INSERT INTO users (username, email, firebase_uid, bio, profile_pic_url) VALUES (${username},${email}, ${firebase_uid}, ${bio}, ${profile_pic_url} )', {username, email , firebase_uid, bio, profile_pic_url})
}

UserService.read = (id) => {
    return db.any('SELECT * FROM users WHERE id=${id}', {id})
}

UserService.update = (id, username, email, firebase_uid, bio, profile_pic_url) => {
    return db.none('UPDATE users SET username=${username}, email=${email}, firebase_uid=${firebase_uid}, bio=${bio}, profile_pic_url=${profile_pic_url}, updatedAt=NOW() WHERE id=${id} ', { id, username, email, firebase_uid, bio, profile_pic_url })
}

UserService.delete = () => {
    return db.none('DELETE FROM users ')
}

module.exports = UserService;