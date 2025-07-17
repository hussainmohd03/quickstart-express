
# 🛠️ Express App Setup Script

A simple Bash script to quickly scaffold a Node.js + Express web application with a complete folder structure, installed dependencies, and boilerplate code.

## 📦 What It Does

- Checks if `npm` is installed
- Prompts you for a project directory name
- Creates standard folders and files: `server.js`, `.env`, `.gitignore`
- Initializes a Node.js project with `npm init`
- Installs commonly used packages: `express`, `mongoose`, `dotenv`, `bcrypt`, `ejs`, `morgan`, etc.
- Sets up `server.js` with starter boilerplate code
- Creates a MongoDB config file

## 🧰 Included Dependencies

- express  
- express-session  
- mongoose  
- method-override  
- path  
- dotenv  
- ejs  
- morgan  
- bcrypt  

## 📁 Folder Structure

```
project-directory/
├── server.js
├── .env
├── .gitignore
├── config/
│   └── db.js
├── routes/
├── models/
├── controllers/
├── views/
│   └── partials/
├── public/
│   ├── stylesheets/
│   └── images/
├── middleware/
└── node_modules/
```

## 🚀 How to Use

```bash
chmod +x setup.sh
./setup.sh
```

Then follow the prompt to enter your project folder name. The script will do the rest.

## ⚠️ Important Notes

- Make sure you have **Node.js and npm** installed before running the script.
- Update the `.env` file with your own **MongoDB connection string** and **session secret**.

## 📬 Feedback

Feel free to open issues or submit PRs if you'd like to improve the script!
