const { db } = require('./db')

const UserService = {};
// (email, firebase_uid, bio, profile_pic_url)
UserService.create = (email, firebase_uid, bio, profile_pic_url) => {
    return db.none('INSERT INTO users (email, firebase_uid, bio, profile_pic_url) VALUES (${email}, ${firebase_uid}, ${bio}, ${profile_pic_url} )', {email , firebase_uid, bio, profile_pic_url})
}

module.exports = UserService;