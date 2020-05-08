<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
    <title>Custom Login Page</title>

    <style>
        .failed {
            color: red;
        }
    </style>

    <style>
        .back {
            color: green;
        }
    </style>

</head>

<body>

<h3>My Custom Login Page</h3>

<form:form action="${pageContext.request.contextPath}/authenticateTheUser" method="POST">

    <c:if test="${param.error != null}">

        <i class="failed">Sorry! You entered invalid username/password.</i>

    </c:if>

    <c:if test="${param.logout != null}">

        <i class="back">You have been logged out.</i>

    </c:if>

    <p>
        <input type="text" name="username" placeholder="User name"/>
    </p>
    <p>
        <input type="password" name="password" placeholder="Password"/>
    </p>

    <input type="submit" value="Login"/>

</form:form>

</body>

</html>












