<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
	<title>luv2code Company Home Page</title>
</head>

<body>
	<h2>luv2code Company Home Page - Yoohoo!!! - Silly Goose - no soup</h2>
	<hr>
	
	<p>
	Welcome to the luv2code Company Home Page
	</p>

	<hr>
	<!-- display user name and role -->	
	<p>
		User: <security:authentication property="principal.username" />
		<br><br>
		Roles(s): <security:authentication property="principal.authorities" />
	</p>

	<security:authorize access="hasRole('MANAGER')">
		<!-- Add a link to point to /leaders ... this is for managers -->
		<p>
			<a href="${pageContext.request.contextPath}/leaders">Leadership Meeting</a>
			(Only for Manager people)
		</p>
	</security:authorize>

	<security:authorize access="hasRole('ADMIN')">
		<!-- Add a link to point to /systems ... this is for the admins -->
		<p>
			<a href="${pageContext.request.contextPath}/systems">IT Systems Meeting</a>
			(Only for Admin people)
		</p>
		</security:authorize>
	<hr>

	<!-- Add a link to point to /leaders ... this is for the managers -->
	<form:form action="${pageContext.request.contextPath}/logout" method="POST">

	</form:form>

	<!-- Add a logout button -->
	<form:form action="${pageContext.request.contextPath}/logout" 
				method="POST">
		<input type="submit" value="Logout" />
	</form:form>
</body>
</html>