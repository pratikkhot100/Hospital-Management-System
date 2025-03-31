<style type="text/css">
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    color: #333;
    background-image: url("img/about.jpg");
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    height: 37vh;
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
    width: 80%; /* Adjust table width */
    margin: 20px auto;
    border-collapse: separate; /* Use separate borders for each cell */
    border-spacing: 0; /* Remove the space between cells */
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow for the table */
    background-color: rgba(255, 255, 255, 0.9);
    border-radius: 12px; /* Rounded corners for the table */
    overflow: hidden;
    text-align: center; /* Ensures text is centered in each cell */
    border: 1px solid #ddd; /* Light gray border around the table */
}

th, td {
    padding: 12px;
    text-align: center; /* Centers text in each table cell */
    border: 1px solid #ddd; /* Border for each cell */
    font-size: 16px; /* Adjust text size for readability */
    background-color: #fff; /* White background for each cell */
}

/* Header Styling */
th {
    background-color: #4CAF50; /* Green background for header */
    color: white; /* White text color for header */
    font-weight: bold; /* Bold text in the header */
}

/* Alternate row styling */
tr:nth-child(even) {
    background-color: #f9f9f9; /* Lighter gray for even rows */
}

tr:nth-child(odd) {
    background-color: #ffffff; /* White background for odd rows */
}

/* Hover effect for table rows */
tr:hover {
    background-color: #f1f1f1; /* Light gray background when hovering */
}

/* Centering content in the table wrapper */
.table-wrapper {
    overflow-x: auto;
    max-height: 400px;
    margin: 0 auto;
    border: 1px solid #ddd;
    border-radius: 12px; /* Rounded corners for the table wrapper */
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    text-align: center; /* Ensures the wrapper content is centered */
}


/* Container */
.container {
    max-width: 75%;
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