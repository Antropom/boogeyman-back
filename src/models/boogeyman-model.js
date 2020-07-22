// DB import
const db = require('../../db');

class BoogeymanModel {
  static getAll(cb) {
    db.query('SELECT * FROM boogeyman', (err, results) => {
      cb(err, results);
    });
  }
}

module.exports = BoogeymanModel;
