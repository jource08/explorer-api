const express = require('express');
const { getAllExpanded } = require('../controllers/folderController'); // Import the controller

const router = express.Router();

// Define the route for fetching all expanded folders and files
router.get('/allExpanded', getAllExpanded); // This will respond to /folders/allExpanded

module.exports = router;
