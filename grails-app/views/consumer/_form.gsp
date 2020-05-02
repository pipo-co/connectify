<div class="form-group">
    <label><g:message code="username"/> *</label>
    <g:hasErrors bean="${consumer}" field="user.username">
        <g:eachError bean="${consumer}" field="user.username">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
%{--    <g:renderErrors bean="${user}" field="username" as="list" />--}%
    <g:textField name="username" class="form-control" value="${fieldValue(bean: consumer?.user, field: 'username')}" placeholder="Please Enter Username"/>
</div>

<div class="form-group">
    <label><g:message code="name"/></label>
    <g:hasErrors bean="${consumer}" field="user.name">
        <g:eachError bean="${consumer}" field="user.name">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
    <g:textField name="name" class="form-control" value="${consumer?.user?.name}" placeholder="Please Last Name"/>
</div>

<div class="form-group">
    <label><g:message code="email.address"/> *</label>
    <g:hasErrors bean="${consumer?.user}" field="email">
        <g:eachError bean="${consumer?.user}" field="email">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
    <g:field type="email" name="email" class="form-control" value="${consumer?.user?.email}" placeholder="Please Enter Email"/>
</div>

<g:if test="${!edit}">
    <div class="form-group">
        <label><g:message code="password"/> *</label>
        <g:hasErrors bean="${consumer?.user}" field="password">
            <g:eachError bean="${consumer?.user}" field="password">
                <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
            </g:eachError>
        </g:hasErrors>
        <g:passwordField name="password" class="form-control" value="${consumer?.user?.password}" placeholder="Please Enter Password"/>
    </div>
</g:if>

<div class="form-group">
    <label><g:message code="last.name"/> *</label>
    <g:hasErrors bean="${consumer}" field="lastName">
        <g:eachError bean="${consumer}" field="lastName">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
    <g:textField name="lastName" class="form-control" value="${fieldValue(bean: consumer, field: 'lastName')}" placeholder="Please Enter Last Name"/>
</div>
