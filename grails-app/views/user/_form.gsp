<div class="form-group">
    <label><g:message code="username"/> *</label>
    <g:hasErrors bean="${user}" field="username">
        <g:eachError bean="${user}" field="username">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
%{--    <g:renderErrors bean="${user}" field="username" as="list" />--}%
    <g:textField name="username" class="form-control" value="${user?.username}" placeholder="Please Enter Username"/>
</div>

<div class="form-group">
    <label><g:message code="name"/></label>
    <g:hasErrors bean="${user}" field="name">
        <g:eachError bean="${user}" field="name">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
    <g:textField name="name" class="form-control" value="${user?.name}" placeholder="Please Last Name"/>
</div>

<div class="form-group">
    <label><g:message code="email.address"/> *</label>
    <g:hasErrors bean="${user}" field="email">
        <g:eachError bean="${user}" field="email">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
    <g:field type="email" name="email" class="form-control" value="${user?.email}" placeholder="Please Enter Email"/>
</div>

<g:if test="${!edit}">
    <div class="form-group">
        <label><g:message code="password"/> *</label>
        <g:hasErrors bean="${user}" field="password">
            <g:eachError bean="${user}" field="password">
                <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
            </g:eachError>
        </g:hasErrors>
        <g:passwordField name="password" class="form-control" value="${user?.password}" placeholder="Please Enter Password"/>
    </div>
</g:if>