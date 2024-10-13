const express = require('express');
const cors = require('cors');
const { sequelize } = require('./db/index');
const folderRoutes = require('./routes/folderRoutes');

const app = express();
app.use(cors()); // Enable CORS for all routes
app.use(express.json());

// Use the folder routes
app.use('/folders', folderRoutes);

// Test the database connection
(async () => {
  try {
    await sequelize.authenticate();
    console.log('Connection to the PostgreSQL database has been established successfully.');
  } catch (error) {
    console.error('Unable to connect to the database:', error);
  }
})();

app.listen(3000, () => {
  console.log('Server is running on port 3000');
});
