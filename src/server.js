require('dotenv').config();
const express = require('express');

const app = express();
const cors = require('cors');

const PORT = process.env.PORT || (process.env.NODE_ENV === 'test' ? 3001 : 8000);

// Import route files here
const boogeymanRoute = require('./routes/boogeyman-route');

app.use(express.json());
app.use(cors());
// prettier-ignore
app.use(
  express.urlencoded({
    extended: true,
  }),
);

// Add app.use here
app.use('/boogeymen', boogeymanRoute);

const server = app.listen(PORT, () => {
  console.log(`🌍 Server is running on port ${PORT}`);
});

module.exports = server;
