<style type="text/css">
        /* General Styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            background-image: url("img/Appointment.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            height: 100vh;
        }

        nav {
            background-color: #28a745;
        }

        nav .navbar-brand {
            color: white;
            font-weight: bold;
        }

        nav .navbar-toggler {
            border-color: white;
        }

        nav .navbar-nav .nav-item .btn {
            background-color: #007bff;
            color: white;
        }

        /* Container for Form */
        .container {
            margin: 20px auto;
            max-width: 500px; /* Adjusted the max-width */
            padding: 15px;
            background-color: rgba(255, 255, 255, 0.8); /* Transparent background */
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-height: 70vh; /* Set max height to make it scrollable */
            overflow-y: auto; /* Scrollable content */
        }

        h1 {
            font-size: 22px; /* Reduced font size */
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        /* Image Styling */
        .appointment-image {
            width: 100%;
            max-width: 300px; /* Reduced image size */
            margin: 0 auto 20px;
            display: block;
            border-radius: 8px;
        }

        /* Form Styling */
        label {
            font-size: 14px; /* Reduced label font size */
            margin-bottom: 5px;
            display: block;
            color: #555;
        }

        input[type="text"],
        input[type="email"],
        input[type="tel"],
        input[type="date"],
        input[type="time"],
        select {
            width: 100%;
            padding: 8px; /* Reduced padding */
            margin-bottom: 10px; /* Reduced margin-bottom */
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        button[type="submit"] {
            width: 100%;
            padding: 8px; /* Reduced padding */
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px; /* Reduced button font size */
        }

        button[type="submit"]:hover {
            background-color: #218838;
        }

        /* Scrollbar Styling for Container */
        .container::-webkit-scrollbar {
            width: 8px;
        }

        .container::-webkit-scrollbar-thumb {
            background-color: #888;
            border-radius: 10px;
        }

        .container::-webkit-scrollbar-thumb:hover {
            background-color: #555;
        }

        /* Responsive Media Queries */
        @media (max-width: 768px) {
            .container {
                margin: 10px;
                padding: 15px;
                max-width: 90%; /* Adjust form width on smaller screens */
            }

            h1 {
                font-size: 20px;
            }

            button[type="submit"] {
                font-size: 12px;
            }
        }
    </style>