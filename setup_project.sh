#!/bin/bash

# Check if npm is installed
if ! command -v npm &> /dev/null
then
    echo "❌ npm is not installed. Please install Node.js before running this script."
    exit 1
fi



# Ask user for the project directory name
read -p "Enter the project directory name: " project_dir



# Create the project directory and navigate into it
mkdir "$project_dir"
cd "$project_dir" || exit  # Exit if cd fails
echo "Created and entered directory: $project_dir"



# create nessesary files
touch server.js .env .gitignore
echo "Created base files: server.js, .env, .gitignore"



# Initialize Node.js project
npm init -y > /dev/null
echo "Initialized Node.js project"



# Install required packages
npm install express express-session mongoose method-override path dotenv ejs morgan bcrypt > /dev/null
echo "Installed dependencies: express, express-session, mongoose, method-override, path, dotenv, ejs, morgan, and bcrypt"


# Create folders
mkdir routes models controllers views config public middleware
mkdir views/partials public/stylesheets public/images
echo "Created project folder structure"



# Create server.js boilerplate
cat <<EOF > server.js
// imports
const express = require('express')
require('dotenv').config()
const session = require('express-session')
const path = require('path')


// Initialize app
const app = express()

// Database Configuration
const mongoose = require('./config/db')

// set Port Configuration
const port = process.env.PORT ? process.env.PORT : 3000

// Require MiddleWares
const methodOverride = require('method-override')
const morgan = require('morgan')


// Require passUserToView & isSignedIn middlewares


// use MiddleWares
app.use(express.urlencoded({ extended: true }))
app.use(methodOverride('_method'))
app.use(morgan('dev'))
app.use(express.static(path.join(__dirname, 'public')))



// Session Configurations
app.use(
  session({
    secret: process.env.SESSION_SECRET,
    resave: false,
    saveUninitialized: true
  })
)

//passUserToView middleware


// Root Route
app.get('/', (req, res) => {
  res.send('Your app is connected . . . ')
})

// Require Routers


// use Routers


// Listener
app.listen(port, () => {
  console.log(\`Server is running on http://localhost:\${port}\`)
})

EOF

echo "Generated server.js boilerplate"


# initialize .gitignore
cat <<EOF > .gitignore
.env
/node_modules
package-lock.json
EOF

echo "Generated .gitignore"



# .env file setup
cat <<EOF > .env
MONGO_URI=<add your connection string here>
PORT=3010
SESSION_SECRET=<add your secret key here>
EOF

echo "Created .env file with placeholders"


# create and setup ./config/db file
cat <<EOF > ./config/db.js
const mongoose = require('mongoose')

mongoose.connect(process.env.MONGO_URI)

mongoose.connection.on('connected', () => {
  console.log(\`connected to Database: \${mongoose.connection.name}\`)
})

module.exports = mongoose
EOF
echo "Created database config in config/db.js"


echo "---------------------------------------------"
echo
echo "✅ Project '$project_dir' created with server.js and full setup."
echo "👉 Please remember to edit your .env file with real MongoDB URI and session secret."

