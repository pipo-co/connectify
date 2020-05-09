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
        <g:message code="consumer" args="['Details']"/>
    </div>
    <div class="card-body">
        <g:if test="${consumer}">
            <table class="table">
                <g:each in="${propertiesList}" var="prop">
                    <tr id="${prop.key}">
                        <th class="text-right"><g:message code="${prop.key}"/></th>
                        <td class="text-left">${prop.value}</td>
                    </tr>
                </g:each>
%{--                <tr>--}%
%{--                    <th class="text-right"><g:message code="username"/></th><td class="text-left">${consumer.user.username}</td>--}%
%{--                </tr>--}%
%{--                <tr>--}%
%{--                    <th class="text-right"><g:message code="name"/></th><td class="text-left">${consumer.user.name}</td>--}%
%{--                </tr>--}%
%{--                <tr>--}%
%{--                    <th class="text-right"><g:message code="email"/></th><td class="text-left">${consumer.user.email}</td>--}%
%{--                </tr>--}%
%{--                <tr>--}%
%{--                    <th class="text-right"><g:message code="password"/></th><td class="text-left">${consumer.user.password}</td>--}%
%{--                </tr>--}%
%{--                <tr>--}%
%{--                    <th class="text-right"><g:message code="last.name"/></th><td class="text-left">${consumer.lastName}</td>--}%
%{--                </tr>--}%
%{--                <tr>--}%
%{--                    <th class="text-right"><g:message code="member.type"/></th><td class="text-left">${member.memberType}</td>--}%
%{--                </tr>--}%
            </table>
        </g:if>
        <div class="form-action-panel">
            <g:link controller="consumer" action="index" class="btn btn-primary"><g:message code="cancel"/></g:link>
        </div>
    </div>
</div>