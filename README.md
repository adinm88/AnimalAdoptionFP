# Animal Adoption Web App

A simple Java web application that allows users to browse animals available for adoption. The project was built using JSP, Servlets, JDBC, MySQL, HTML/CSS, and Bootstrap. The application demonstrates dynamic web content, database integration, user authentication, session management, responsive design, and form handling.

The website allows users to:
- View animals available for adoption
- Log into the application
- Browse dynamic animal listings
- Access responsive web pages

Administrators are able to:
- Create new animals
- Create user accounts
- View registered users
- Access protected admin-only pages

---

# Features

- Displays a list of animals from a MySQL database
- Uses JSP and Servlets to display dynamic content
- Connects to a MySQL database using JDBC
- User login/logout system
- Session management for logged in users
- Role-based authorization for administrators
- Responsive design using Bootstrap
- Form handling and validation
- Error handling for invalid or unauthorized actions

---

# Technologies Used

- Java
- JSP
- Servlets
- JDBC
- MySQL
- Apache Tomcat
- HTML/CSS
- Bootstrap 5
- NetBeans

---

# Capabilities Implemented

## 1. Serve Dynamic Web Content
JSP pages dynamically display animal and user data retrieved from the database.

## 2. Database Integration
The application uses JDBC to connect to a MySQL database.

## 3. Authentication and Authorization
Users can log in with credentials stored in the database. Admin pages are restricted based on user roles.

## 4. Session Management
Sessions are used to keep users logged in and store user information across pages.

## 5. Form Handling and Validation
Forms are used to create animals and users with input validation and error handling.

## 6. Responsive Design
Bootstrap was implemented to create responsive layouts that adapt to different screen sizes.

## 7. Error Handling
The application handles invalid input and unauthorized access attempts with user-friendly error messages.

---

# Setup

# Create the database

```sql
CREATE DATABASE animal_adoption;

USE animal_adoption;

CREATE TABLE animals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    species VARCHAR(50),
    breed VARCHAR(50),
    age INT
);

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    role VARCHAR(20) NOT NULL
);

INSERT INTO animals (name, species, breed, age) VALUES
('Buddy', 'Dog', 'Labrador', 3),
('Mittens', 'Cat', 'Siamese', 2);

INSERT INTO users (username, password, role) VALUES
('admin', 'admin123', 'ADMIN'),
('user1', 'password123', 'USER'); /* can add more users from the admin panel later */
```

---

# Configure Database Connection

Update `DBConnection.java` with your MySQL username and password.

Example:

```java
String url = "jdbc:mysql://localhost:3306/animal_adoption";
String username = "root";
String password = "yourpassword";
```

---

# Run the Application

1. Start MySQL and Apache Tomcat
2. Open the project in NetBeans
3. Run the project on the Tomcat server
4. Open the application in your browser:

```text
http://localhost:8080/AnimalAdoptionFP/
```

---

# Screens Included

- Home page
- Animal listings page
- Login page
- Admin dashboard
- Create user page
- User list page

---

# Author

Adin Mujakovic
