<style type="text/css">
/* Body styles */
body {
	background-image: url("img/userimage.jpg");
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center;
	height: 75vh;
	margin: 0;
}

/* Main content container */
.main-content {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100%;
	padding: 20px;
	overflow: hidden;
}

.container {
	max-width: 600px;
	width: 100%;
	padding: 20px;
	background-color: rgba(255, 255, 255, 0.9);
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	overflow-y: auto; /* Allow scrolling within the container */
	max-height: 75vh; /* Adjust max height */
	display: flex;
	flex-direction: column;
}

.card-body {
	padding: 20px;
}

.form-label {
	font-weight: bold;
}

.form-control {
	border-radius: 8px;
	margin-bottom: 20px;
}

button {
	font-size: 16px;
	padding: 12px;
	border-radius: 8px;
	width: 100%;
	background-color: #28a745;
	color: white;
	border: none;
}

button:hover {
	background-color: #218838;
}

.alert-message {
	text-align: center;
	font-size: 18px;
	margin-top: 15px;
}

/* Responsive adjustments */
@media ( max-width : 768px) {
	.container {
		max-width: 90%;
		margin-top: 20px;
		padding: 15px;
	}
}
</style>