let pgp = null;
let db = null;

if (!pgp) {
    // Needed to connect to the data base
    pgp = require('pg-promise')({});
    db = pgp('Postgres://localhost/mio')
}

module.exports = {
    db,
}

