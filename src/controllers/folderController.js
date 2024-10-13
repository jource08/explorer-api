const { Folder, File } = require('../db/index');

// Controller to handle fetching all folders and their expanded structure
const getAllExpanded = async (req, res) => {
  try {
    const folderData = await Folder.findAll({
      include: [{
        model: File,
        required: false, // This makes it a LEFT JOIN
      }],
      order: [['createdAt', 'ASC']],
    });

    const result = buildFolderTree(folderData);
    res.json(result);
  } catch (error) {
    console.error('Error fetching expanded folder structure:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
};

// Recursive function to build folder tree
const buildFolderTree = (data) => {
  const rootFolders = data.filter(folder => folder.parentId === null);
  const folderMap = {};

  data.forEach((folder) => {
    folderMap[folder.id] = folder;
    folder.subFolders = [];
    folder.files = folder.Files || [];
  });

  data.forEach((folder) => {
    if (folder.parentId) {
      folderMap[folder.parentId].subFolders.push(folder);
    }
  });

  return rootFolders;
};

module.exports = { getAllExpanded };
