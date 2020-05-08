<div class="form-group">
    <label><g:message code="name"/> *</label>
    <g:hasErrors bean="${activityT}" field="name">
        <g:eachError bean="${activityT}" field="user.username">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
%{--    <g:renderErrors bean="${user}" field="username" as="list" />--}%
    <g:textField name="name" class="form-control" value="${fieldValue(bean: activityT, field: 'name')}" placeholder="Please Enter Activity Name"/>
</div>

<div class="form-group">
    <label><g:message code="description"/></label>
    <g:hasErrors bean="${activityT}" field="description">
        <g:eachError bean="${activityT}" field="description">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
    <g:textField name="description" class="form-control" value="${activityT?.description}" placeholder="Please Enter Description"/>
</div>

<div class="form-group">
    <label><g:message code="duration"/> *</label>
    <g:hasErrors bean="${activityT}" field="duration">
        <g:eachError bean="${activityT}" field="duration">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
    <g:textField name="duration" class="form-control" value="${activityT?.duration}" placeholder="Please Enter Duration"/>
</div>

<div class="form-group">
    <label><g:message code="address"/> *</label>
    <g:hasErrors bean="${activityT}" field="address">
        <g:eachError bean="${activityT}" field="address">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
    <g:textField name="address" class="form-control" value="${activityT?.address}" placeholder="Please Enter Address"/>
</div>

<div class="form-group">
    <label><g:message code="max.participants"/> *</label>
    <g:hasErrors bean="${activityT}" field="maxParticipants">
        <g:eachError bean="${activityT}" field="maxParticipants">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
    <g:textField name="maxParticipants" class="form-control" value="${fieldValue(bean: activityT, field: 'maxParticipants')}" placeholder="Please Enter Max Participants"/>
</div>