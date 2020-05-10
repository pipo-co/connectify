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
            </table>
        </g:if>
        <div class="form-action-panel">
            <g:link controller="consumer" action="index" class="btn btn-primary"><g:message code="cancel"/></g:link>
        </div>
    </div>
</div>