
const express = require('express');

const app = express();

app.get('/ping', (req,res) => {
    res.json({
        message: '🏓 '
    })
})

module.exports = { app, }