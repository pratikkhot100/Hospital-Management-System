<style>
/* General Body Styles */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    color: #333;
    background-image: url("img/Adminimage.jpg");
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    min-height: 100vh;
    margin: 0;
}

/* Navbar */
.navbar {
    margin-bottom: 20px;
}

.navbar-nav .nav-item .nav-link {
    transition: 0.3s;
}

.navbar-brand {
    font-weight: bold;
}

/* Header */
h1 {
    text-align: center;
    color: black;
    font-size: 36px;
    font-weight: bold;
    text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.6);
    margin-top: 50px;
}

/* Card Styles */
.card {
    margin: 20px;
    border-radius: 15px;
    transition: all 0.3s ease-in-out;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    background-color: transparent;
    color: white;
}

.card-header {
    background-color: #007bff;
    color: white;
    font-weight: bold;
    text-align: center;
    border-top-left-radius: 15px;
    border-top-right-radius: 15px;
    padding: 15px;
}

.card-body {
    text-align: center;
    padding: 30px;
    background-color: rgba(200, 200, 200, 0.5);
    border-bottom-left-radius: 15px;
    border-bottom-right-radius: 15px;
}

.card-title {
    font-size: 4rem;
    color: black;
}

.card:hover {
    transform: translateY(-10px);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
}

/* Button */
button {
    background-color: black;
    color: white;
    border: none;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 14px;
    margin-top: 10px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 300s;
}

button:hover {
    background-color: #45a049;
}

/* Container */
.container {
    max-width: 90%;
    margin: 0 auto;
}

/* Table Styles */
table {
    width: 100%;
    margin: 20px auto;
    border-collapse: collapse;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    background-color: rgba(255, 255, 255, 0.9);
    border-radius: 10px;
    overflow: hidden;
}

th, td {
    padding: 12px;
    text-align: left;
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

/* Scrollable Table */
.table-wrapper {
    overflow-x: auto;
    max-height: 400px;
    margin: 0 auto;
    border: 1px solid #ddd;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

/* Responsive Styling */
@media (max-width: 768px) {
    .card-columns {
        column-count: 1;
    }

    .card {
        margin-bottom: 20px;
    }

    .navbar-nav .nav-item {
        margin-right: 10px;
    }
}

@media (max-width: 480px) {
    h1 {
        font-size: 28px;
    }

    .card-title {
        font-size: 2rem;
    }

    .search-box input {
        width: 80%;
    }

    .search-box button {
        width: 20%;
    }

    .navbar-brand {
        font-size: 1.2rem;
    }
}
</style>