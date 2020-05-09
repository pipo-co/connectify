<div class="form-group">
    <label><g:message code="init.date"/> *</label>
    <g:hasErrors bean="${activity}" field="initDate">
        <g:eachError bean="${activity}" field="initDate">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
%{--    <g:renderErrors bean="${user}" field="username" as="list" />--}%
    <g:datePicker name="initDate" class="form-control" value="${fieldValue(bean: activity, field: 'initDate')}" noSelection="['':'-Choose-']" placeholder="Please Enter Activity Initial Date"/>
</div>

<g:hiddenField name="activityTId" value="${activityTId}" />
