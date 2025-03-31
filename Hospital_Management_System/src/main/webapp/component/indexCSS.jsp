<style type="text/css">
/* Add color transition effects to cards */
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
	transition: transform 0.3s, box-shadow 0.3s, background-color 0.3s;
}

.paint-card:hover {
	transform: scale(1.05); /* Slightly enlarge the card on hover */
	box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
	/* Make shadow more prominent */
	background-color: #f0f8ff; /* Light blue background on hover */
}

.paint-card.active {
	background-color: #d3f9d8; /* Light green when active */
	border: 2px solid #4CAF50; /* Green border when active */
}

.navbar-nav .nav-item .nav-link {
	transition: 0.3s;
	color: white; /* Default text color */
}

.navbar-nav .nav-item .nav-link:hover {
	color: #ff5733 !important; /* Change color on hover */
	background-color: rgba(255, 87, 51, 0.2); /* Background effect */
	border-radius: 5px;
}

/* Card text color transition */
.paint-card .card-body p {
	transition: color 0.3s;
}

.paint-card:hover .card-body p {
	color: #007bff; /* Blue color for text on hover */
}

.paint-card:active .card-body p {
	color: #d9534f; /* Red color for text when active */
}

/* Specific card styles for hover */
.paint-card:hover .card-body {
	background-color: #eaf7ff;
	/* Slight light blue background for the content */
}

/* Add smooth transitions to other card elements */
.card-body {
	transition: background-color 0.3s, color 0.3s;
}

/* Additional hover effects for doctor images */
.card img {
	transition: transform 0.3s ease-in-out;
}

.card:hover img {
	transform: scale(1.1); /* Slight zoom effect on image hover */
}

.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
/* General modal styling */
.modal-content {
	border: none;
	border-radius: 15px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
	overflow: hidden;
}

.modal-header {
	background: linear-gradient(135deg, #0062cc, #0096ff);
	padding: 20px;
	border: none;
	color: white;
}

.modal-title {
	font-weight: 600;
}

.modal-body {
	padding: 30px;
}

.btn-close {
	filter: brightness(0) invert(1);
}

.form-control {
	padding: 12px 15px;
	border-radius: 10px;
	border: 2px solid #eee;
	transition: all 0.3s ease;
}

.form-control:focus {
	border-color: #0062cc;
	box-shadow: none;
}

.input-group-text {
	border: none;
	background: transparent;
	position: absolute;
	right: 15px;
	top: 50%;
	transform: translateY(-50%);
	z-index: 4;
	color: #666;
}

.input-group {
	position: relative;
}

.btn-login {
	padding: 12px 20px;
	background: linear-gradient(135deg, #0062cc, #0096ff);
	border: none;
	border-radius: 10px;
	font-weight: 500;
	width: 100%;
	transition: all 0.3s ease;
}

.btn-login:hover {
	transform: translateY(-2px);
	box-shadow: 0 5px 15px rgba(0, 98, 204, 0.3);
}

.social-login {
	display: flex;
	gap: 10px;
	margin-top: 20px;
}

.btn-social {
	flex: 1;
	padding: 12px;
	border-radius: 10px;
	border: 2px solid #eee;
	background: white;
	transition: all 0.3s ease;
}

.btn-social:hover {
	background: #f8f9fa;
	transform: translateY(-2px);
}

.btn-social i {
	margin-right: 10px;
}

.divider {
	text-align: center;
	margin: 20px 0;
	position: relative;
}

.divider::before {
	content: '';
	position: absolute;
	left: 0;
	top: 50%;
	width: 45%;
	height: 1px;
	background: #eee;
}

.divider::after {
	content: '';
	position: absolute;
	right: 0;
	top: 50%;
	width: 45%;
	height: 1px;
	background: #eee;
}

.divider span {
	background: white;
	padding: 0 10px;
	color: #666;
	font-size: 0.9rem;
}

.form-check {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin: 15px 0;
}

.password-toggle {
	cursor: pointer;
}

.register-link {
	text-align: center;
	margin-top: 20px;
	font-size: 0.9rem;
}

.modal-header {
	background-color: #007bff;
	color: white;
}

.table thead {
	background-color: #007bff;
	color: white;
}

.table tbody tr:hover {
	background-color: #f8f9fa;
}

.btn-primary {
	background-color: #007bff;
	border: none;
}

.btn-primary:hover {
	background-color: #0056b3;
}
/* Search Bar */
.search-box {
	margin-bottom: 15px;
}

a {
	color: #444;
	text-decoration: none;
}

input[type="text"], input[type="password"] {
	padding: 10px;
	font-size: 16px;
	border: 1px solid #ccc;
	border-radius: 5px;
	width: 100%;
	box-sizing: border-box;
}

input[type="text"]:focus, input[type="password"]:focus {
	border-color: #007bff;
	outline: none;
}

input[type="submit"] {
	background-color: #007bff;
	color: white;
	padding: 10px 15px;
	border: none;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s;
}

input[type="submit"]:hover {
	background-color: #0056b3;
}

.btn-close {
	background-color: transparent;
	border: none;
	font-size: 1.5rem;
}

.btn-close:focus {
	outline: none;
}

@media ( max-width : 768px) {
	.modal-dialog {
		max-width: 90%;
	}
}
</style>