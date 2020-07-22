// Import router
const boogeymanRouter = require('express').Router();

// import controller
const BoogeymanController = require('../controllers/boogeyman-controller');

boogeymanRouter.get('/', BoogeymanController.getAll);

module.exports = boogeymanRouter;
