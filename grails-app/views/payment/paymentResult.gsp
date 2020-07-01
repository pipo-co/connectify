<%--
  Created by IntelliJ IDEA.
  User: tobias
  Date: 30/5/20
  Time: 16:00
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<meta name="layout" content="main"/>
<g:if test="${!success}">
    <h1>Ocurrio un error realizando el pago.</h1>
    <v-btn rounded class="ml-4"  color="#59D0B4" href="${createLink(controller: 'payment', action: 'index')}">
        Volver a intenatrlo
    </v-btn>
    <v-btn outlined class="ml-4"  color="#59D0B4" href="${createLink(controller: 'index', action: 'index')}">
        Volver al inicio
    </v-btn>
</g:if>