<%--
  Created by IntelliJ IDEA.
  User: tobias
  Date: 30/4/20
  Time: 23:43
--%>

%{--Include Main Layout--}%
<meta name="layout" content="main"/>

<div class="card">
    <div class="card-header">
        <g:message code="conectioner" args="['List Of']"/>

        %{--Actions--}%
        <span class="float-right">

            %{--Search Panel --}%
            <div class="btn-group">
                <g:form controller="conectioner" action="index" method="GET">
                    <div class="input-group" id="search-area">
                        <g:select name="colName" class="form-control" from="[username: 'username', name: 'Name', email: 'Email']" value="${params?.colName}" optionKey="key" optionValue="value"/>
                        <g:textField name="colValue" class="form-control" value="${params?.colValue}"/>
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="submit">Search</button>
                        </span>
                    </div>
                </g:form>
            </div>

            %{--Create and Reload Panel--}%
            <div class="btn-group">
                <g:link controller="conectioner" action="create" class="btn btn-success"><g:message code="create"/></g:link>
                <g:link controller="conectioner" action="index" class="btn btn-primary"><g:message code="reload"/></g:link>
            </div>
        </span>
    </div>

    %{--Table Panel--}%
    <div class="card-body">
        <table class="table table-bordered">
            <thead class="thead-dark">
            <tr>
                <g:sortableColumn property="username" title="${g.message(code: "username")}"/>
                <g:sortableColumn property="name" title="${g.message(code: "name")}"/>
                <g:sortableColumn property="email" title="${g.message(code: "email")}"/>
                <g:sortableColumn property="password" title="${g.message(code: "password")}"/>
                <th class="action-row"><g:message code="action"/></th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${userList}" var="info">
                <tr>
                    <td>${info?.username}</td> %{--OJO CAMBIAR--}%
                    <td>${info?.name}</td>
                    <td>${info?.email}</td>
                    <td>${info?.password}</td>

                    %{--Table Actions --}%
                    <td>
                        <div class="btn-group">
                            <g:link controller="conectioner" action="details" class="btn btn-secondary" id="${info.id}">Detail</g:link>
                            <g:link controller="conectioner" action="edit" class="btn btn-secondary" id="${info.id}">Edit</g:link>
                            <g:link controller="conectioner" action="delete" id="${info.id}" class="btn btn-secondary delete-confirmation">Delete</g:link>
                        </div>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
        %{--Pagination Area--}%
 %{--       <div class="paginate">
            <g:paginate total="${total ?: 0}" />
        </div>--}%
    </div>
</div>