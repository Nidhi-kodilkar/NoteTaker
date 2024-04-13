<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet">

<title>Add Notes</title>
</head>
<body>

	<%@include file="navbar.jsp"%>
	<br>
	<div class="container text-center">
	<form action="SaveNote" method="post">
		<div class="form-group">
			<h3>
				<label for="exampleFormControlInput1">Title</label>
			</h3>
			<input type="text" required name="title" class="form-control"
				id="title" placeholder="note title">
		</div>
		<br>
		<div class="form-group">
			<h3>
				<label for="exampleFormControlTextarea1">Note</label>
			</h3>
			<textarea class="form-control" required name="note"
				id="exampleFormControlTextarea1" rows="6" placeholder="add note"></textarea>
		</div>

		<div class="container text-center">
			<button type="submit" class="btn btn-primary">Add</button>
		</div>

	</form>
	</div>



</body>
</html>