<style type="text/css">
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f9;
	background-image: url("img/hos3.jpg");
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

.container {
	margin: 20px auto;
	max-width: 500px;
	padding: 15px;
	background-color: rgba(255, 255, 255, 0.8);
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	max-height: 70vh;
	overflow-y: auto;
}

h1 {
	font-size: 22px;
	color: #333;
	text-align: center;
	margin-bottom: 20px;
}

.appointment-image {
	width: 100%;
	max-width: 300px;
	margin: 0 auto 20px;
	display: block;
	border-radius: 8px;
}

label {
	font-size: 14px;
	margin-bottom: 5px;
	display: block;
	color: #555;
}

input[type="text"], input[type="email"], input[type="tel"], input[type="date"],
	input[type="time"], select {
	width: 100%;
	padding: 8px;
	margin-bottom: 10px;
	border-radius: 5px;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

button[type="submit"] {
	width: 100%;
	padding: 8px;
	background-color: #28a745;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 14px;
}

button[type="submit"]:hover {
	background-color: #218838;
}

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

@media ( max-width : 768px) {
	.container {
		margin: 10px;
		padding: 15px;
		max-width: 90%;
	}
	h1 {
		font-size: 20px;
	}
	button[type="submit"] {
		font-size: 12px;
	}
}
</style>