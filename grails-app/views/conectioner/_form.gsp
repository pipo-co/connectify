<div class="form-group">
    <label><g:message code="username"/> *</label>
    <g:hasErrors bean="${conectioner}" field="user.username">
        <g:eachError bean="${conectioner}" field="user.username">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
%{--    <g:renderErrors bean="${user}" field="username" as="list" />--}%
    <g:textField name="username" class="form-control" value="${fieldValue(bean: conectioner?.user, field: 'username')}" placeholder="Please Enter Username"/>
</div>

<div class="form-group">
    <label><g:message code="name"/></label>
    <g:hasErrors bean="${conectioner}" field="user.name">
        <g:eachError bean="${conectioner}" field="user.name">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
    <g:textField name="name" class="form-control" value="${conectioner?.user?.name}" placeholder="Please Last Name"/>
</div>

<div class="form-group">
    <label><g:message code="email.address"/> *</label>
    <g:hasErrors bean="${conectioner?.user}" field="email">
        <g:eachError bean="${conectioner?.user}" field="email">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
    <g:field type="email" name="email" class="form-control" value="${conectioner?.user?.email}" placeholder="Please Enter Email"/>
</div>

<g:if test="${!edit}">
    <div class="form-group">
        <label><g:message code="password"/> *</label>
        <g:hasErrors bean="${conectioner?.user}" field="password">
            <g:eachError bean="${conectioner?.user}" field="password">
                <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
            </g:eachError>
        </g:hasErrors>
        <g:passwordField name="password" class="form-control" value="${conectioner?.user?.password}" placeholder="Please Enter Password"/>
    </div>
</g:if>

<div class="form-group">
    <label><g:message code="cbu"/> *</label>
    <g:hasErrors bean="${conectioner}" field="cbu">
        <g:eachError bean="${conectioner}" field="cbu">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
    <g:textField name="cbu" class="form-control" value="${fieldValue(bean: conectioner, field: 'cbu')}" placeholder="Please Enter CBU"/>
</div>

<div class="form-group">
    <label><g:message code="avatar"/></label>
    <g:field name="avatar" class="form-control" type="file" placeholder="Please Upload Avatar"/>
    <g:if test="${conectioner?.avatar}">
        <img src="${resource(dir: "avatar", file: "/${conectioner.image}")}" class="img-thumbnail" style="margin-top: 10px; height: 100px; width: 100px;"/>
    </g:if>
</div>
