<%--
  Created by IntelliJ IDEA.
  User: tobias
  Date: 30/5/20
  Time: 16:00
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Payment</title>
    <meta name="layout" content="main"/>
</head>

<body>
    <g:each in="${preferencesInfo}" var="preferenceInfo">
        <a href="${preferenceInfo.preference.initPoint}">Suscribirse por ${preferenceInfo.months} meses. A solo $${preferenceInfo.price}</a>
    </g:each>
</body>
</html>