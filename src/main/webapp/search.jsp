<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.todo.entities.Note, com.todo.servlet.SearchServlet, java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet">

<title>Search Results</title>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-12">

				<br>
				<h1>Search Results</h1>
				<br>
				<%
				List<Note> notes = (List<Note>) request.getAttribute("list");
				if (notes != null && !notes.isEmpty()) {
					for (Note note : notes) {
				%>

				<div class="card">
					<img class="card-img-top text-center" src="images/note.png"
						alt="Card image cap" style="max-width: 90px">
					<div class="card-body">
						<h5 class="card-title">
							<%=note.getTitle()%>
						</h5>
						<p class="card-text">
							<%=note.getContent()%>
						</p>
						<a href="update.jsp" class="btn btn-primary">Update</a>
					</div>
				</div>

				<%
				}
				} else {
				%>

				<h1>Sorry!! No notes found</h1>

				<%
				}
				%>
			</div>
		</div>
	</div>

</body>
</html>