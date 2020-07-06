<%--
  Created by IntelliJ IDEA.
  User: tobias
  Date: 5/7/20
  Time: 14:45
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title>Email Verification Failed</title>
        <meta name="layout" content="main">
    </head>

    <body>
    <v-container>
        <v-row align="center" justify="center">
            <v-col >
                <v-img class="ma-auto" src="${assetPath(src: '/logo.png')}" height="160px" width="160px"></v-img>
                <br>
                <p class="white--text text-h4">The email hasn't been verified yet. </p>
                <p class="white--text text-h4">Make sure to do it before using the app. </p>
                <br>
                <v-btn dark class="px-4" outlined color="#59D0B4" href="/">Return home</v-btn>
                <v-btn dark class="px-4" outlined color="#59D0B4" href="/authentication/login">Log in</v-btn>
            </v-col>
        </v-row>
    </v-container>
    </body>
</html>