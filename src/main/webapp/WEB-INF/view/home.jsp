<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html>

<head>
    <title>Home Page</title>
</head>

<body>
<h2>Home Page</h2>
<hr>
User : <security:authentication property="principal.username"/>
<br><br>
Role(s) : <security:authentication property="principal.authorities"/>

<!-- to leaders -->
<p>
    <security:authorize access="hasRole('MANAGER')" >
        <a href="${pageContext.request.contextPath}/leaders">LeaderShip Meeting</a>
        (Only for Managers)
    </security:authorize>
</p>

<!-- to systems -->
<p>
    <security:authorize access="hasRole('ADMIN')" >
        <a href="${pageContext.request.contextPath}/systems">SysAdmins Meeting</a>
        (Only for Admins)
    </security:authorize>
</p>

<hr>

<form:form action="${pageContext.request.contextPath}/logout" method="POST">

    <br>
    <input type="submit" value="Logout"/>

</form:form>

</body>

</html>