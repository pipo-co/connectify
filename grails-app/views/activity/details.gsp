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
        <g:message code="conectioner" args="['Details']"/>
    </div>
    <div class="card-body">
        <g:if test="${conectioner}">
            <table class="table">
                <tr>
                    <th class="text-right"><g:message code="username"/></th><td class="text-left">${conectioner.user.username}</td>
                </tr>
                <tr>
                    <th class="text-right"><g:message code="name"/></th><td class="text-left">${conectioner.user.name}</td>
                </tr>
                <tr>
                    <th class="text-right"><g:message code="email"/></th><td class="text-left">${conectioner.user.email}</td>
                </tr>
                <tr>
                    <th class="text-right"><g:message code="password"/></th><td class="text-left">${conectioner.user.password}</td>
                </tr>
                <tr>
                    <th class="text-right"><g:message code="cbu"/></th><td class="text-left">${conectioner.cbu}</td>
                </tr>
%{--                <tr>--}%
%{--                    <th class="text-right"><g:message code="member.type"/></th><td class="text-left">${member.memberType}</td>--}%
%{--                </tr>--}%
            </table>
        </g:if>
        <div class="form-action-panel">
            <g:link controller="conectioner" action="index" class="btn btn-primary"><g:message code="cancel"/></g:link>
        </div>
    </div>
</div>