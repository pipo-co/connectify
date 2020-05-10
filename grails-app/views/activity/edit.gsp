<%--
  Created by IntelliJ IDEA.
  User: tobias
  Date: 1/5/20
  Time: 00:40
--%>


%{--Include Main Layout--}%
<meta name="layout" content="main"/>

<div class="card">
    <div class="card-header">
        <g:message code="conectioner" args="['Update']"/>
    </div>
    <div class="card-body">
        <g:form controller="conectioner" action="update" enctype="multipart/form-data">
            <g:hiddenField name="id" value="${conectioner.id}"/>
            <g:render template="form" model="[edit:'yes']"/>
            <div class="form-action-panel">
                <g:submitButton class="btn btn-primary" name="update" value="${g.message(code: "update")}"/>
                <g:link controller="conectioner" action="index" class="btn btn-primary"><g:message code="cancel"/></g:link>
            </div>
        </g:form>
    </div>
</div>