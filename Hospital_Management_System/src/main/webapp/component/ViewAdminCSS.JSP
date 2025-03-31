<style>
/* Global Styles */
body {
	font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    color: #333;
    background-image: url("img/hos3.jpg");
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

/* Navbar links styling */
.navbar-nav .nav-item .nav-link {
	transition: 0.3s;
}

/* Adjust container for full height */
.container {
	max-width: 1140px;
	margin: 0 auto;
	padding: 0 20px;
	display: flex;
	flex-direction: column;
	align-items: center;
	z-index: 10; /* Ensure content is above background */
	padding-bottom: 20px;
}

/* Row Flexbox Setup */
.row {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	gap: 20px;
	margin-top: 20px;
	width: 100%;
}

/* Center the last two cards */
.row.center-cards {
	justify-content: center;
}

/* Column Setup */
.col-md-4 {
	flex: 1 1 300px;
	margin: 10px;
	max-width: 30%;
	box-sizing: border-box;
}

/* Card Styles */
.card {
	border-radius: 12px;
	padding: 20px;
	text-align: center;
	background-color: rgba(255, 255, 255, 0.8);
	/* Transparent background */
	backdrop-filter: blur(10px);
	/* Optional: Adds a blur effect to the background behind the card */
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease, box-shadow 0.3s ease, background-color
		0.3s ease;
	cursor: pointer;
	height: auto;
	width: 100%;
}

/* Hover Effect on Cards */
.card:hover {
	transform: scale(1.05) rotate(2deg);
	box-shadow: 0 20px 30px rgba(0, 0, 0, 0.2);
	background-color: rgba(240, 248, 255, 0.9);
	/* Slightly more opaque on hover */
}

/* Card Title (h4) */
.card h4 {
	color: #333;
	font-weight: bold;
	font-size: 24px;
	margin-bottom: 20px;
	transition: color 0.3s ease, transform 0.3s ease;
}

/* Hover Effect on Card Title */
.card:hover h4 {
	color: #007bff;
	transform: translateY(-5px);
}

/* Card Link */
.card a {
	text-decoration: none;
	color: #007bff;
	font-weight: bold;
	transition: color 0.3s ease, transform 0.3s ease;
	display: block;
	margin-bottom: 15px;
}

/* Hover Effect on Link */
.card:hover a {
	color: #0056b3;
	transform: translateX(5px);
}

/* Button Styling Inside Cards */
.card button {
	background-color: #4CAF50;
	color: white;
	border: none;
	padding: 14px 36px;
	font-size: 16px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease, transform 0.3s ease;
	margin-top: 20px;
}

/* Hover Effect on Button */
.card button:hover {
	background-color: #45a049;
	transform: scale(1.1);
}

/* Responsive Adjustment */
@media ( max-width : 768px) {
	.col-md-4 {
		flex: 1 1 100%;
		max-width: 100%;
	}
	.card {
		padding: 20px;
	}
	.navbar-nav .nav-item .nav-link {
		font-size: 14px;
	}
}

@media ( max-width : 576px) {
	.navbar-nav .nav-item .nav-link {
		font-size: 12px;
	}
	.card h4 {
		font-size: 20px;
	}
	.card button {
		font-size: 14px;
		padding: 12px 30px;
	}
}
</style>