%{--Username--}%
<div class="form-group">
    <label><g:message code="username"/></label>
    <g:hasErrors bean="${conectioner}" field="user.username">
        <g:eachError bean="${conectioner}" field="user.username">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
%{--    <g:renderErrors bean="${user}" field="username" as="list" />--}%
    <g:textField name="username" class="form-control" value="${fieldValue(bean: conectioner?.user, field: 'username')}" placeholder="Please Enter Username"/>
</div>

%{--Name--}%
<div class="form-group">
    <label><g:message code="name"/></label>
    <g:hasErrors bean="${conectioner}" field="user.name">
        <g:eachError bean="${conectioner}" field="user.name">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
    <g:textField name="name" class="form-control" value="${conectioner?.user?.name}" placeholder="Please Last Name"/>
</div>

%{--Email--}%
<div class="form-group">
    <label><g:message code="email.address"/> *</label>
    <g:hasErrors bean="${conectioner}" field="user.email">
        <g:eachError bean="${conectioner}" field="user.email">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
    <g:field type="email" name="email" class="form-control" value="${conectioner?.user?.email}" placeholder="Please Enter Email"/>
</div>

%{--Pass--}%
<g:if test="${!edit}">
    <div class="form-group">
        <label><g:message code="password"/> *</label>
        <g:hasErrors bean="${conectioner}" field="user.password">
            <g:eachError bean="${conectioner}" field="user.password">
                <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
            </g:eachError>
        </g:hasErrors>
        <g:passwordField name="password" class="form-control" value="${conectioner?.user?.password}" placeholder="Please Enter Password"/>
    </div>
</g:if>

%{--CBU--}%
<div class="form-group">
    <label><g:message code="cbu"/> *</label>
    <g:hasErrors bean="${conectioner}" field="cbu">
        <g:eachError bean="${conectioner}" field="cbu">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
    <g:field type="number" name="cbu" class="form-control" value="${fieldValue(bean: conectioner, field: 'cbu')}" placeholder="Please Enter CBU"/>
</div>

%{--Avatar--}%
<div class="form-group">
    <label><g:message code="avatar"/></label>
    <g:field name="avatar" class="form-control" type="file" placeholder="Please Upload Avatar"/>
</div>

%{--Country--}%
<div class="form-group">
    <label><g:message code="country"/> *</label>
    <g:hasErrors bean="${conectioner}" field="country">
        <g:eachError bean="${conectioner}" field="country">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
    <g:select name="country"
              from="${['Argentina', 'Chile','Brasil']}"
              value="${fieldValue(bean: conectioner, field: 'country')}"
    />
</div>

<div class="form-group">
    <label><g:message code="province"/> *</label>
    <g:hasErrors bean="${conectioner}" field="province">
        <g:eachError bean="${conectioner}" field="province">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
    <g:select name="province"
              from="${['Neuquen', 'Jujuy','La pampa']}"
              value="${fieldValue(bean: conectioner, field: 'province')}"
    />
</div>

<div class="form-group">
    <label><g:message code="district"/> *</label>
    <g:hasErrors bean="${conectioner}" field="district">
        <g:eachError bean="${conectioner}" field="district">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
    <g:textField name="district" class="form-control" value="${fieldValue(bean: conectioner, field: 'district')}" placeholder="Please Enter District"/>
</div>

<div class="form-group">
    <label><g:message code="street"/> *</label>
    <g:hasErrors bean="${conectioner}" field="street">
        <g:eachError bean="${conectioner}" field="street">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
    <g:textField name="street" class="form-control" value="${fieldValue(bean: conectioner, field: 'street')}" placeholder="Please Enter Street"/>
</div>

<div class="form-group">
    <label><g:message code="house.number"/> *</label>
    <g:hasErrors bean="${conectioner}" field="houseNumber">
        <g:eachError bean="${conectioner}" field="houseNumber">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
    <g:field type="number" name="houseNumber" class="form-control" value="${fieldValue(bean: conectioner, field: 'houseNumber')}" placeholder="Please Enter House Number"/>
</div>

<div class="form-group">
    <label><g:message code="cp"/> *</label>
    <g:hasErrors bean="${conectioner}" field="cp">
        <g:eachError bean="${conectioner}" field="cp">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
    <g:field type="number" name="cp" class="form-control" value="${fieldValue(bean: conectioner, field: 'cp')}" placeholder="Please Enter Postal Code"/>
</div>

<div class="form-group">
    <label><g:message code="phone.number"/> *</label>
    <g:hasErrors bean="${conectioner}" field="phoneNumber">
        <g:eachError bean="${conectioner}" field="phoneNumber">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
    <g:field type="number" name="phoneNumber" class="form-control" value="${fieldValue(bean: conectioner, field: 'phoneNumber')}" placeholder="Please Enter phone number"/>
</div>

<div class="form-group">
    <label><g:message code="phone.type"/> *</label>
    <g:hasErrors bean="${conectioner}" field="phoneType">
        <g:eachError bean="${conectioner}" field="phoneType">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
    <g:select name="phoneType"
              from="${['cell', 'house']}"
              value="${fieldValue(bean: conectioner, field: 'phoneType')}"
    />
</div>
