const { Folder, File } = require('../db/index');

// Controller to handle fetching all folders and their expanded structure
const getAllExpanded = async (req, res) => {
  try {
    const maxLevel = req.query.maxLevel ? parseInt(req.query.maxLevel, 10) : 100; // Default to 100 if not provided
    const folderData = await getFolderWithSubfolders(null, 0, maxLevel); // Start with root folders (parentId is null)
    res.json(folderData);
  } catch (error) {
    console.error('Error fetching expanded folder structure:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
};

// Recursive function to get folders and their subfolders/files with level tracking
const getFolderWithSubfolders = async (parentId, currentLevel, maxLevel) => {
  // Stop recursion if max level is reached
  if (currentLevel > maxLevel) return [];

  // Fetch all folders with the given parentId
  const folders = await Folder.findAll({
    where: { parentId },
    order: [['createdAt', 'ASC']], // Order by creation date
  });

  // Recursively fetch subfolders for each folder, only if the max level is not exceeded
  for (const folder of folders) {
    // Fetch files associated with the folder
    const files = await folder.getFiles(); // Use Sequelize association method to get files
    folder.dataValues.files = files;

    const subFolders = await getFolderWithSubfolders(folder.id, currentLevel + 1, maxLevel); // Increment the level
    folder.dataValues.subFolders = subFolders; // Attach subfolders to the current folder
  }

  return folders;
};

module.exports = { getAllExpanded };
