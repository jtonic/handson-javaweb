<%--
  User: jtonic
  Date: 9/14/13
  Time: 12:28 AM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Login page</title>
</head>
<body>

<%--<c:set var="password" value="<%= request.getParameter(\"password\") %>" />--%>
<%--Better use the JSP EL (expression language) instead of above jsp expression of taking the passed parameter.--%>
<c:set var="password" value="${param['password']}" />
<c:set var="username" value="${param['username']}" />
<form action="login" method="post">
    <pre>
        <c:choose>
            <c:when test="${empty password || empty username}">
                <p>No password or username</p>
            </c:when>
            <c:when test="${username == 'admin'}">
                <jsp:forward page="/hellojstl"/>
                <%--"${ pageContext.forward('/hellojsp')}"--%> <%--non standard el--%>
            </c:when>
            <c:otherwise>
                <pre>
                    Password: ${username}
                    Username: ${password}
                </pre>
            </c:otherwise>
        </c:choose>
        <label for="username">Username</label><input type="text" name="username" id="username">
        <label for="password">Password</label><input type="password" name="password" id="password">
        <button type="submit">Login</button>
    </pre>
</form>

</body>
</html>