<%--
  Created by IntelliJ IDEA.
  User: tobias
  Date: 1/5/20
  Time: 00:46
--%>

%{--Include Main Layout--}%
<meta name="layout" content="main"/>

<div class="card">
    <div class="card-header">
        <g:message code="user" args="['Details']"/>
    </div>
    <div class="card-body">
        <g:if test="${user}">
            <table class="table">
                <tr>
                    <th class="text-right"><g:message code="username"/></th><td class="text-left">${user.username}</td>
                </tr>
                <tr>
                    <th class="text-right"><g:message code="name"/></th><td class="text-left">${user.name}</td>
                </tr>
                <tr>
                    <th class="text-right"><g:message code="email"/></th><td class="text-left">${user.email}</td>
                </tr>
                <tr>
                    <th class="text-right"><g:message code="password"/></th><td class="text-left">${user.password}</td>
                </tr>
%{--                <tr>--}%
%{--                    <th class="text-right"><g:message code="member.type"/></th><td class="text-left">${member.memberType}</td>--}%
%{--                </tr>--}%
            </table>
        </g:if>
        <div class="form-action-panel">
            <g:link controller="member" action="index" class="btn btn-primary"><g:message code="cancel"/></g:link>
        </div>
    </div>
</div>