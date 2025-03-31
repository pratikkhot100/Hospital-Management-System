<style type="text/css">
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    color: #333;
    background-image: url("img/about.jpg");
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    height: 7vh;
    margin: 0;
}

h1 {
    text-align: center;
    color: Black; /* White color for text */
    font-size: 36px; /* Larger font size */
    font-weight: bold; /* Bold text */
    text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.6); /* Subtle text shadow for better visibility */
    margin-top: 50px; /* Margin for spacing */
}

/* Search Box */
.search-box {
    text-align: center;
    margin: 20px;
}

.search-box input {
    padding: 8px;
    font-size: 16px;
    width: 50%;
    max-width: 400px;
    border-radius: 5px;
    border: 1px solid #ccc;
    margin-right: 10px;
}

.search-box button {
    padding: 8px 16px;
    font-size: 16px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.search-box button:hover {
    background-color: #45a049;
}

/* Table */
table {
    width: 100%;
    margin: 20px auto;
    border-collapse: collapse;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    background-color: rgba(255, 255, 255, 0.9);
    border-radius: 10px;
    overflow: hidden;
    text-align: center; /* Centers content in the entire table */
}

th, td {
    padding: 12px;
    text-align: center; /* Centers text in each table cell */
    border: 1px solid #ddd;
}

th {
    background-color: #4CAF50;
    color: white;
}

tr:nth-child(even) {
    background-color: #f2f2f2;
}

tr:hover {
    background-color: #ddd;
}

/* Centering content in the table wrapper */
.table-wrapper {
    overflow-x: auto;
    max-height: 400px;
    margin: 0 auto;
    border: 1px solid #ddd;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    text-align: center; /* Ensures the wrapper content is centered */
}

/* Container */
.container {
    max-width: 90%;
    margin: 0 auto;
}

/* Button */
.button-container {
    text-align: center;
    margin-top: 50px;
}

button {
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 10px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

button:hover {
    background-color: #45a049;
}

/* Navbar */
.navbar {
    margin-bottom: 20px;
}

.navbar-nav .nav-item .nav-link {
    transition: 0.3s;
}

/* Ensure the table is scrollable on smaller devices */
@media (max-width: 768px) {
    table {
        width: 100%;
        margin: 10px auto;
        overflow-x: auto;
    }

    table th, table td {
        padding: 8px 10px;
    }

    /* Navbar responsive adjustment */
    .navbar-nav .nav-item {
        margin-right: 10px;
    }
}
</style>