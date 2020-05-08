<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Denied page</title>
</head>
<body>
    <h2>
        You are not authorized to enter this page
    </h2>
    <hr>
    <a href="${pageContext.request.contextPath}/">Back to home page</a>
</body>
</html>
