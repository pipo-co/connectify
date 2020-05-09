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
        <g:message code="activities" args="['List Of']"/>

        %{--Actions--}%
        <span class="float-right">

            %{--Create and Reload Panel--}%
            <div class="btn-group">
                <g:link controller="activity" action="create" id="${activityTId}" class="btn btn-success"><g:message code="create"/></g:link>
                <g:link controller="activity" action="index" id="${activityTId}" class="btn btn-primary"><g:message code="reload"/></g:link>
            </div>
        </span>
    </div>

    %{--Table Panel--}%
    <div class="card-body">
        <table class="table table-bordered">
            <thead class="thead-dark">
            <tr>
                <th><g:message code="init.date"/></th>
                <th><g:message code="participants"/></th>
                <th class="action-row"><g:message code="action"/></th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${activityList}" var="info">
                <tr>
                    <td>${info?.initDate}</td>
                    <td>${info?.participants}</td>

                    %{--Table Actions --}%
                    <td>
                        <div class="btn-group">
                            <g:link controller="activity" action="details" class="btn btn-secondary" id="${info.id}">Detail</g:link>
%{--                            <g:link controller="activity" action="edit" class="btn btn-secondary" id="${info.id}">Edit</g:link>--}%
                            <g:link controller="activity" action="delete" id="${info.id}" class="btn btn-secondary delete-confirmation">Delete</g:link>
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