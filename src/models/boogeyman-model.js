// DB import
const db = require('../../db');

class BoogeymanModel {
  static getAll(cb) {
    db.query('SELECT * FROM Boogeyman', (err, results) => {
      cb(err, results);
    });
  }

  static getOne(id, cb) {
    db.query('SELECT * FROM Boogeyman WHERE id = ?', id, (err, results) => {
      cb(err, results);
    });
  }

  static post(datas, cb) {
    db.query('INSERT INTO Boogeyman SET ?', datas, (err, results) => {
      cb(err, results);
    });
  }

  // prettier-ignore
  static edit(id, datas, cb) {
    db.query('UPDATE Boogeyman SET ? WHERE id = ?', [datas, id], (err, results) => {
      cb(err, results);
    });
  }

  static delete(id, cb) {
    db.query('DELETE FROM Boogeyman WHERE id = ?', id, (err, results) => {
      cb(err, results);
    });
  }
}

module.exports = BoogeymanModel;
