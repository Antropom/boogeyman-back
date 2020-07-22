// Import router
const boogeymanRouter = require('express').Router();

// import controller
const BoogeymanController = require('../controllers/boogeyman-controller');

boogeymanRouter.get('/', BoogeymanController.getAll);
boogeymanRouter.get('/:id', BoogeymanController.getOne);
boogeymanRouter.post('/', BoogeymanController.post);
boogeymanRouter.put('/:id', BoogeymanController.edit);
boogeymanRouter.delete('/:id', BoogeymanController.delete);

module.exports = boogeymanRouter;
