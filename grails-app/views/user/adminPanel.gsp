<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Admin Panel</title>
    <meta name="layout" content="main"/>
    <asset:stylesheet src="pagination.css"/>
</head>

<body>
    <p>${usersCount}</p>
    <g:each in="${users}" var="user">
        <p>${user.name}</p>
    </g:each>

    <g:if test="${usersCount > 12}">
        <div class="pagination">
            <g:paginate controller="user" action="adminPanel" total="${usersCount}" max="12" />
        </div>
    </g:if>
</body>
</html>