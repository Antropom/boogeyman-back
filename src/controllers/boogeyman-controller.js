// import model
const BoogeymanModel = require('../models/boogeyman-model');

class BoogeymanController {
  static getAll(req, res) {
    try {
      BoogeymanModel.getAll((error, results) => {
        if (!results.length) {
          res.status(404).json({
            status: 'error',
            errorMessage: 'Not found',
          });
        } else {
          res.status(200).json({
            status: 'success',
            results,
          });
        }
      });
    } catch (err) {
      res.status(500).json({
        status: 'error',
        errorMessage: 'Our server encountered an error performing the request',
      });
    }
  }
  // describe all method you want here
}

module.exports = BoogeymanController;
