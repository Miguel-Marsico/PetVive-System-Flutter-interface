<h1>
    PetVive System - Flutter Interface 🐾
</h1>

https://github.com/Miguel-Marsico/PetVive-System/assets/158609724/0d9e5189-fbab-4a64-915d-1d9d85253261

 ## 📋 Topics
<div>
 • <a href="#-about">About</a> </br>
 • <a href="#-tools">Tools</a> </br>
 • <a href="#-database-structure">Database structure</a> </br>
 • <a href="#-how-to-execute-the-project">How to execute the project</a> </br>
 • <a href="#-license">License</a></br>
</div>

## 📗 About

**PetVive** is a system designed with the purpose of improving Full Stack development skills in a **Flutter** application. This platform was developed with the aim of providing veterinarians with a powerful tool for managing their patients' information efficiently and effectively.

## 🔧 Tools

### 💻 **APP** ( Flutter )

### 🔄 **API** ([Pyhton](https://www.python.org))

- [Flask](https://flask.palletsprojects.com/en/3.0.x/)
- [Psycopg2](https://www.psycopg.org/docs/)
- [HashLib](https://docs.python.org/3/library/hashlib.html)

### 🛠️ **Utilities** 

- Database: **[PostgreSQL](https://www.postgresql.org/docs/)**
- Compilers: **[Pycharm Community](https://www.jetbrains.com/pt-br/pycharm/)** + **[AndroidStudio](https://developer.android.com/studio?hl=pt-br)** 

## 📂 Database structure

### Functionality of DAO (Data Access Object) in the Project:

The **DAO** is a crucial component of this project that manages interaction with the **PostgreSQL** database. It separates the database logic from the rest of the application, enabling database operations to be performed **independently**.

In this project, we have two main DAOs:

**AnimalDAO**: Manages operations related to animals, such as adding, retrieving, updating, and deleting records from the "animals" table in the database.

**UsuarioDAO**: Manages operations related to users, such as adding and authenticating users, using the "usuarios" table in the database.

### The project utilizes a PostgreSQL database with the following structure:

**1** - 🐾 Table "**animais**":

#### Fields: id, nome, idade, raca, tipo, observacoes, ativo.
```bash
Stores information about animals, including name, age, breed, type, observations, and active status.
```

**2** - 👤 Table "**usuarios**":

#### Fields: id, username, senha.

```bash
Stores information about users, including username and password (stored as a password hash).
```

## ▶ How to execute the project

### The project is divided into **2** parts:

 - 🌐 **Frontend** (Flutter)
 - ⚙️ **Backend** (Python API, PostgreSQL DataBase)
 
 💡 The backend must be running for the frontend to work.
 
 💡 Using a Python virtual environment (venv) is essential to isolate and manage project dependencies in a secure and reproducible manner.

### ⚙️ Backend:

#### Create a venv:

1 - Navigate to the directory where you want to create the virtual environment:
```bash
 cd /path/to/your/project
```
2 - Create virtual environment:
```bash
 python3 -m venv name
```
3 - activate the virtual environment:
```bash
 name\Scripts\activate
```

#### Installing libraries:

```bash
 $ pip install Flask
 $ pip install flask_jwt_extended
 $ pip install flasgger
 $ pip install flask_cors
```
```bash
 $ pip install psycopg2
``` 
```bash
 $ pip install hashlib
```

#### Library import:

```bash
 from flask import Flask, request, jsonify

 from flask_jwt_extended import JWTManager, jwt_required, create_access_token, get_jwt_identity

 from flasgger import Swagger

 import psycopg2

 from abc import ABC, abstractmethod

 from flask_cors import CORS

 import hashlib
```

#### DataBase:

#### The database will be **automatically** configured by **Psycopg2**, just create it and add the necessary informations in the code:

```bash
 183: dao = AnimalDAOImplPostgresql('database-name', 'user', 'password', 'host')
 184: usuario_dao = UsuarioDAOImplPostgresql('database-name', 'user', 'password', 'host')
```

#### After that, just run the **API** and the **backend** should be working

### 🌐 Frontend:

#### With the **Backend running**, just open "**main.dart**" on an **emulator** or other **device** and everything should work perfectly.

## 📜 License

### This project is under the MIT license. 
<br>
Developed by Miguel Marsico 👋🏻
