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
    <title>Taglib example</title>
</head>
<body>
    <h4>Hello JSTL example!!!</h4>
    <c:set var="now" value="<%= new java.util.Date()%>"/>
    <p>Formatted data (now): ${now}</p>
    <p>Formatted data (now): <f:formatDate value="${now}" timeStyle="short" dateStyle="short" type="both"/></p>
</body>
</html>