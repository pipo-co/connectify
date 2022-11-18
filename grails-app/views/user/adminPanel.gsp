<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Admin Panel</title>
    <meta name="layout" content="main"/>
    <asset:stylesheet src="pagination.css"/>
</head>

<body>
<v-container>
    <v-row justify="center">
        <v-col cols="6">
            <p class="text-h4">Admin Panel</p>
            <p class="text-h6">Number of users ${usersCount}</p>
            <v-card dark >
                <table class="ma-auto">
                    <tr>
                        <th class="pa-2">Username</th>
                        <th class="pa-2">User's name</th>
                        <th class="pa-2">Email</th>
                        <th class="pa-2">User type</th>
                        <th class="pa-2">Is Active</th>
                        <th class="pa-2">Actions</th>
                    </tr>

                    <g:each in="${users}" var="user">
                        <tr>
                            <td class="pa-1">${user.username}</td>
                            <td class="pa-1">${user.name}</td>
                            <td class="pa-1">${user.email}</td>
                            <td class="pa-1">${user.userType}</td>
                            <td class="pa-1">${user.isActive}</td>
                            <g:if test="${!user.isTypeAdmin()}">
                                <td class="pa-1">
                                    <g:if test="${user.isTypeConsumer()}">
                                        <g:link controller="consumer" action="delete" id="${user.consumer.id}">Delete</g:link>
                                    </g:if>
                                    <g:else>
                                        <g:link controller="conectioner" action="delete" id="${user.conectioner.id}">Delete</g:link>
                                    </g:else>
                                </td>
                            </g:if>
                        </tr>
                    </g:each>
                </table>
                <g:if test="${usersCount > 10}">
                    <div class="pagination">
                        <g:paginate controller="user" action="adminPanel" total="${usersCount}" max="10"/>
                    </div>
                </g:if>
            </v-card>
        </v-col>
    </v-row>
</v-container>



</body>
</html>