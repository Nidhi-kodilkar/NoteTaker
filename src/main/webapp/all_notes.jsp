<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="org.hibernate.internal.build.AllowPrintStacktrace"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.todo.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="org.hibernate.Session"%>
<%@page
	import="org.hibernate.SessionFactory, 
org.hibernate.Transaction, 
java.util.*, 
com.todo.*"%>
<%@page import="org.hibernate.query.Query, com.todo.entities.Note, java.text.Format, java.text.SimpleDateFormat,
java.util.Date"%>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet">

<title>All notes</title>
</head>
<body>

	<%@include file="navbar.jsp"%>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-12">

				<%
				Session s = FactoryProvider.getFactory().openSession();

				try {
					Query query = s.createQuery("from Note");
					List<Note> list = query.list();

					for (Note note : list) {
				%>
				<div class="card">
					<div class="container text-center">
						<img class="card-img-top" src="images/note.png"
							style="max-width: 90px" alt="Card image cap">
					</div>
					<br>
					<div class="container text-center text-primary">
						<p><%
							
						Format f = new SimpleDateFormat("dd/MM/yy");
						String date = f.format(note.getDate());
						
						out.print(date);
						%></p>

					</div>
					<div class="card-body">
						<h5 class="card-title"><%=note.getTitle()%></h5>
						<p class="card-text"><%=note.getContent()%></p>
						<div class="container text-center">
							<a href="DeleteServlet?note_id=<%=note.getId()%>"
								class="btn btn-danger">Delete</a> <a
								href="update.jsp?note_id=<%=note.getId()%>"
								class="btn btn-primary">Update</a>
						</div>

					</div>
				</div>

				<br>
				<%
				}

				} catch (Exception e) {
				e.printStackTrace();
				} finally {
				if (s != null && s.isOpen()) {
				s.close();
				}

				}
				%>
			</div>
		</div>
	</div>
</body>
</html>