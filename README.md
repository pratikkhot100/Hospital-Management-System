# Hospital Management System

This **Hospital Management System (HMS)** is a Java-based application designed to streamline the management of various hospital operations such as patient management, doctor management, appointment scheduling, and report generation hospital management system. Integrated a role-based authentication system with three-login part Admin, Doctor and User to ensure secure access and data privacy.

## Features

- **Patient Management**: Add, update, delete, and view patient records.
- **Doctor Management**: Manage doctors' information, including specialties and schedules.
- **Appointment Scheduling**: Book, view, modify, and cancel patient appointments with doctors.
- **Reports**: Generate detailed reports based on patient records, appointments.
  
## Key Features

1. User Authentication & Security:

  Secure login & signup with password hashing.
  Proper session management to prevent unauthorized access.
  Users are redirected to the dashboard.jsp upon successful login.
  Logout feature to destroy sessions and prevent session hijacking.


2. Role-Based Access Control:

  Admin: Can manage doctors, view and manage all appointments, View all user Data and access reports, Make Appointments for User, Add new Doctor in Database.
  Doctors: Can view their scheduled appointments and View all docort list.
  Patients: Can book appointments.


3. Appointment Booking & Management:

  Patients can schedule appointments based on doctor availability.
  Doctors receive notifications of new appointments.
  Admins can monitor all appointments.


4. Secure & Structured Development:

  JSP & Servlets for dynamic web page rendering.
  MVC Architecture for better separation of concerns.
  MySQL Database to store users, appointments, and doctors securely.
  Prepared Statements to prevent SQL Injection.
  Session timeout & auto logout for security.


5. User-Friendly Dashboard (dashboard.jsp)

  Displays upcoming appointments.
  Shows doctor availability.
  Allows easy navigation for patients, doctors, and admins.


**Technology Stack**

  Frontend: HTML, CSS, JavaScript, Bootstrap
  Backend: Java, JSP, Servlets, JDBC Java Database Connectivity
  Database: MySQL
  Security Measures: Password hashing, session handling, input validation

**Security Enhancements**

  Session Management: Only dashboard.jsp is accessible after login; users are redirected if they try to bypass authentication.
  Password Encryption: User passwords are hashed before storing in the database.
  Input Validation: Prevents SQL Injection and XSS attacks.
  CSRF Protection: Tokens used to prevent cross-site request forgery.
  This project ensures a secure, scalable, and efficient hospital appointment management system with robust session and authentication handling.

## Technologies Used
- **Frontend**: Html, CSS, Javascripet, Bootstrap.
- **Java**: Core language for application development.
- **JSP**: Used for view rendering, i.e., displaying dynamic content to users Works as the frontend part of the MVC (Model-View-Controller) pattern Can embed Java code within HTML for fetching and displaying data dynamically.
- **Servlet**: Act as the controller in the MVC pattern Handle HTTP requests (e.g., login, signup, appointment booking) Process business logic, interact with the database, and forward responses to JSP pages.
- **JDBC**: Java Database Connectivity for connecting to the database.
- **MySQL**: Used for database management.
- **Swing/JavaFX**: For creating a graphical user interface (GUI).
- **Maven/Gradle**: Build automation (if used).
## Images

### Home Page

![Uploading Screenshot 2025-03-20 175114.png…]()


## Installation

### Prerequisites

1. **Java JDK**: Ensure Java is installed on your system. You can download it from the [official site](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html).
2. **MySQL**: Install MySQL for database management. You can download it from the [official MySQL website](https://dev.mysql.com/downloads/installer/).
3. **IDE**: Any Java IDE like IntelliJ IDEA, Eclipse, or NetBeans can be used.

### Setup Instructions

1. **Clone the repository**:

   ```bash
   git clone https://github.com/pratikkhot100/Hospital-Management-System.git
   
## MySQL Database

### Create the Database in MYSQL Workbench

  1. Open MySQL and run the following SQL commands to set up the Hospital database**

    CREATE DATABASE Hospital;
    USE Hospital;

### Create Tables

  2. Run the following SQL commands to create the necessary tables**

    CREATE TABLE appointment (
        id INT AUTO_INCREMENT PRIMARY KEY,
        Full_Name VARCHAR(100) NOT NULL,
        Email_id VARCHAR(100) NOT NULL,
        Mobile_no VARCHAR(15) NOT NULL,
        Specialist VARCHAR(100) NOT NULL,
        Appointment_date DATE,
        Appointment_time TIME
      );

     CREATE TABLE users (
        id INT AUTO_INCREMENT PRIMARY KEY,
        username VARCHAR(255) NOT NULL,
        Email_id VARCHAR(255) NOT NULL UNIQUE,
        password VARCHAR(12) NOT NULL
      );

      CREATE TABLE doctor (
          id INT AUTO_INCREMENT PRIMARY KEY,
          Full_name VARCHAR(255) NOT NULL,
          Email_id VARCHAR(255) NOT NULL UNIQUE,
          Password VARCHAR(12) NOT NULL,
          Mobile_no VARCHAR(12) NOT NULL UNIQUE,
          Specialization VARCHAR(255) NOT NULL,
          Registration_date DATE
         );

      CREATE TABLE registration (
          id INT AUTO_INCREMENT PRIMARY KEY,
          Full_name VARCHAR(255) NOT NULL,
          Email_id VARCHAR(255) NOT NULL UNIQUE,
          password VARCHAR(12) NOT NULL,
          Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        );

      CREATE TABLE contact_submissions (
        id INT AUTO_INCREMENT PRIMARY KEY,
        full_name VARCHAR(255) NOT NULL,
        email VARCHAR(255) NOT NULL,
        message TEXT NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
       );

### Insert Example Data:

  3. Insert sample data into the users table
   
    INSERT INTO users (username, Email_id, password)
    VALUES 
    ('Pratik Khot', 'pratikkhot@company.com', 'pratik123');

  4. You can also view data from tables using

    SELECT * FROM doctor;
    SELECT * FROM registration;
    SELECT * FROM appointment;
    SELECT * FROM contact_submissions;

 ## Contact Information

  GitHub: https://github.com/pratikkhot100

  LinkedIn: https://www.linkedin.com/in/pratikkhot01

  Email: pratikkhot1207@gmail.com


