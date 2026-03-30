# Animal Adoption Web App

A simple Java web application that displays animals available for adoption. Built with **JSP, Servlets, and MySQL**.  The website will allow users to view animals that are available for adoption and also search up animals with filters. Users can fill out a form to show interest in adopting a pet, while an admin page will allow animals to be added or updated. This project is a full web application with JSP, Servlets, and MySQL.

## Features

- Displays a list of animals from a MySQL database.
- Uses JSP and Servlets to show dynamic content.
- Connects to a database using JDBC.

## Setup

1. Clone the repository:

```bash
git clone https://github.com/adinm88/AnimalAdoptionFP.git
```

2. Create the database and table:

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

INSERT INTO animals (name, species, breed, age) VALUES
('Buddy', 'Dog', 'Labrador', 3),
('Mittens', 'Cat', 'Siamese', 2);
```

3. Update `DBConnection.java` with your MySQL username and password. Currently in there is a sample one used by me.
4. Run the project in NetBeans with Tomcat.
5. Open the app in your browser:

```http
http://localhost:8080/AnimalAdoptionFP/animals
```

## Future Work

- Finish Capabilities 3, 4, 5, 6, and 7
