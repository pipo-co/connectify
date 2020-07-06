
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Admin Panel</title>
</head>

<body>
    <p>${usersCount}</p>
    <g:each in="${users}" var="user">
        <p>${user.name}</p>
    </g:each>

%{--    <g:paginate controller="user" action="adminPanel" total="${usersCount}" />--}%
</body>
</html>