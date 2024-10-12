require('dotenv').config();
const { Sequelize, DataTypes } = require('sequelize');

// Create a new instance of Sequelize
const sequelize = new Sequelize(process.env.DATABASE_URL, {
  dialect: 'postgres',
  logging: false, // Set to true for SQL logging
});

// Test the database connection
(async () => {
  try {
    await sequelize.authenticate();
    console.log('Connection to the PostgreSQL database has been established successfully.');
  } catch (error) {
    console.error('Unable to connect to the database:', error);
  }
})();

// Define your models
const Folder = sequelize.define('folders', { // Lowercase table name
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true, // Auto-increment for serial type
  },
  name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  parentId: {
    type: DataTypes.INTEGER, // Change to INTEGER for foreign key reference
    allowNull: true,
    field: 'parent_id',
  },
  isHidden: {
    type: DataTypes.BOOLEAN,
    defaultValue: false,
    field: 'is_hidden',
  },
  icon: {
    type: DataTypes.STRING,
    defaultValue: 'folder',
  },
  createdAt: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW,
    field: 'created_at',
  },
  modifiedAt: {
    type: DataTypes.DATE,
    allowNull: true,
    field: 'modified_at',
  },
}, {
  tableName: 'folders', // Explicitly specify the table name
  timestamps: false, // Disable automatic timestamp fields
});

const File = sequelize.define('files', { // Lowercase table name
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true, // Auto-increment for serial type
  },
  name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  type: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  size: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  folderId: {
    type: DataTypes.INTEGER, // Change to INTEGER for foreign key reference
    allowNull: false,
    field: 'folder_id', // Specify the field name in the database
  },
  isHidden: {
    type: DataTypes.BOOLEAN,
    defaultValue: false,
    field: 'is_hidden', // Specify the field name in the database
  },
  createdAt: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW,
    field: 'created_at', // Specify the field name in the database
  },
  modifiedAt: {
    type: DataTypes.DATE,
    allowNull: true,
    field: 'modified_at', // Specify the field name in the database
  },
}, {
  tableName: 'files', // Explicitly specify the table name
  timestamps: false, // Disable automatic timestamp fields
});

// Set up associations
Folder.hasMany(File, { foreignKey: 'folder_id' });
File.belongsTo(Folder, { foreignKey: 'folder_id' });

module.exports = { sequelize, Folder, File };
