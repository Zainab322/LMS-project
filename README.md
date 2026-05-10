# Library Management System in Java

This project is a Library Management System implemented in Java, utilizing Object-Oriented Programming (OOP) principles, JavaFX for the Graphical User Interface (GUI), and incorporating the Observer Pattern and MVC (Model-View-Controller) architecture.

## Features

- **User-Friendly Interface**: The JavaFX GUI provides an intuitive and easy-to-use interface for both librarians and users.

- **Observer Pattern**: The system utilizes the Observer design pattern, allowing effective communication between different components.

- **MVC Architecture**: The Model-View-Controller architecture ensures a clean and organized structure for efficient development and maintenance.

# Software Re-Engineering Final Project

## Project Overview
This repository contains the complete implementation of the Software Re-Engineering final project. The project includes:
- Open-source Java LMS project analysis
- SonarQube static code analysis
- Code smell detection and refactoring
- Hospital database normalization
- Prisma ORM implementation
- SQL schema refactoring
- ETL migration and validation scripts

---

# Technologies Used

- Java
- JavaFX
- SonarQube
- SonarScanner
- Docker
- MySQL
- Prisma ORM
- Python

---

# Repository Structure

```text
LMS-project/
hospital-db-prisma/
sql/
scripts/
README.md
sonar-project.properties

1. Start SonarQube
Start Existing Container
docker start sonarqube
OR Create New SonarQube Container
docker run -d --name sonarqube -p 9000:9000 sonarqube:community

Open SonarQube dashboard:

http://localhost:9000

Default credentials:

Username: admin
Password: admin
2. Run SonarScanner

Move into LMS project directory:

cd LMS-project

Run scanner:

sonar-scanner.bat ^
-D"sonar.projectKey=LMS-Project" ^
-D"sonar.sources=." ^
-D"sonar.host.url=http://localhost:9000" ^
-D"sonar.login=YOUR_TOKEN"

Replace YOUR_TOKEN with the generated SonarQube project token.

3. Load Hospital Database Schema
Open MySQL
mysql -u root -p
Create Database
CREATE DATABASE healthbridge_hospital;
USE healthbridge_hospital;
4. Execute SQL Scripts
Load Legacy Schema
mysql -u root -p healthbridge_hospital < sql/legacy_schema.sql
Load Refactored Schema
mysql -u root -p healthbridge_hospital < sql/refactored_schema.sql
5. Prisma Setup

Move into Prisma project folder:

cd hospital-db-prisma

Install dependencies:

npm install

Run migration:

npx prisma migrate dev

Generate Prisma client:

npx prisma generate
6. Execute Migration Script

Install Python MySQL connector:

pip install mysql-connector-python

Run ETL migration:

python scripts/migration_etl.py
7. Run Validation Queries
mysql -u root -p healthbridge_hospital < sql/validation_queries.sql
Project Components
Part A
Java project selection and setup
Part B
SonarQube analysis and code smell detection
Part C
Dependency mapping and technical debt analysis
Part D
Dynamic program analysis and CFG generation
Part E
Data smell identification and prioritization
Part F
Schema normalization and refactoring
Part G
ETL migration and validation
Author

Software Re-Engineering Final Project


---
