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
            status: 'Success',
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

  static getOne(req, res) {
    const { id } = req.params;
    try {
      BoogeymanModel.getOne(id, (_, results) => {
        if (results.length === 0) {
          res.status(404).json({
            status: 'error',
            errorMessage: 'Not found',
          });
        } else {
          res.status(200).json({
            status: 'Success',
            results: results[0],
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

  static post(req, res) {
    try {
      BoogeymanModel.post(req.body, (error, results) => {
        console.log(req.body);
        if (!req.body.name && !req.body.avatar && !req.body.bio) {
          res.status(422).json({
            status: 'error',
            errorMessage: 'Required field(s) missing',
          });
        } else {
          res.status(201).json({
            message: 'Created',
            id: results.insertId,
            ...req.body,
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

  static edit(req, res) {
    const { id } = req.params;
    try {
      if (req.body.name || req.body.avatar || req.body.bio || req.body.votes) {
        BoogeymanModel.getOne(id, (_, results) => {
          if (results.length === 0) {
            res.status(422).json({
              status: 'error',
              errorMessage: 'ID unknown',
            });
          } else {
            BoogeymanModel.edit(id, req.body, () => {
              res.status(200).json({
                message: 'Succesfully modified',
                ...req.body,
              });
            });
          }
        });
      } else {
        res.status(422).json({
          status: 'error',
          errorMessage: 'Required field(s) missing',
        });
      }
    } catch (err) {
      res.status(500).json({
        status: 'error',
        errorMessage: 'Our server encountered an error performing the request',
      });
    }
  }

  static delete(req, res) {
    const { id } = req.params;
    try {
      BoogeymanModel.getOne(id, (_, results) => {
        if (results.length === 0) {
          res.status(404).json({
            status: 'error',
            errorMessage: 'ID unknown',
          });
        } else {
          BoogeymanModel.delete(id, () => {
            res.sendStatus(204);
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
}

module.exports = BoogeymanController;
