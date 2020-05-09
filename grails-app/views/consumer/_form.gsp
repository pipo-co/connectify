%{--Username--}%
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

%{--Name--}%
<div class="form-group">
    <label><g:message code="name"/></label>
    <g:hasErrors bean="${consumer}" field="user.name">
        <g:eachError bean="${consumer}" field="user.name">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
    <g:textField name="name" class="form-control" value="${consumer?.user?.name}" placeholder="Please Last Name"/>
</div>

%{--Email--}%
<div class="form-group">
    <label><g:message code="email.address"/> *</label>
    <g:hasErrors bean="${consumer}" field="user.email">
        <g:eachError bean="${consumer}" field="user.email">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
    <g:field type="email" name="email" class="form-control" value="${consumer?.user?.email}" placeholder="Please Enter Email"/>
</div>

%{--Pass--}%
<g:if test="${!edit}">
    <div class="form-group">
        <label><g:message code="password"/> *</label>
        <g:hasErrors bean="${consumer}" field="user.password">
            <g:eachError bean="${consumer}" field="user.password">
                <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
            </g:eachError>
        </g:hasErrors>
        <g:passwordField name="password" class="form-control" value="${consumer?.user?.password}" placeholder="Please Enter Password"/>
    </div>
</g:if>

%{--Lastname--}%
<div class="form-group">
    <label><g:message code="last.name"/> *</label>
    <g:hasErrors bean="${consumer}" field="lastName">
        <g:eachError bean="${consumer}" field="lastName">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
    <g:textField name="lastName" class="form-control" value="${fieldValue(bean: consumer, field: 'lastName')}" placeholder="Please Enter Last Name"/>
</div>

%{--Avatar--}%
<div class="form-group">
    <label><g:message code="avatar"/></label>
    <g:field name="avatar" class="form-control" type="file" placeholder="Please Upload Avatar"/>
</div>

%{--Doctype--}%
<div class="form-group">
    <label><g:message code="doc.type"/> *</label>
    <g:hasErrors bean="${consumer}" field="docType">
        <g:eachError bean="${consumer}" field="docType">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
    <g:select name="docType"
              from="${['DNI', 'CI','Passport']}"
              value="${fieldValue(bean: consumer, field: 'docType')}"
    />
</div>

%{--Document--}%
<div class="form-group">
    <label><g:message code="document"/> *</label>
    <g:hasErrors bean="${consumer}" field="document">
        <g:eachError bean="${consumer}" field="document">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
    <g:field type="number" name="document" class="form-control" value="${fieldValue(bean: consumer, field: 'document')}" placeholder="Please Enter Document"/>
</div>

%{--Country--}%
<div class="form-group">
    <label><g:message code="country"/> *</label>
    <g:hasErrors bean="${consumer}" field="country">
        <g:eachError bean="${consumer}" field="country">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
    <g:select name="country"
              from="${['Argentina', 'Chile','Brasil']}"
              value="${fieldValue(bean: consumer, field: 'country')}"
              />
</div>

<div class="form-group">
    <label><g:message code="province"/> *</label>
    <g:hasErrors bean="${consumer}" field="province">
        <g:eachError bean="${consumer}" field="province">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
    <g:select name="province"
              from="${['Neuquen', 'Jujuy','La pampa']}"
              value="${fieldValue(bean: consumer, field: 'province')}"
    />
</div>

<div class="form-group">
    <label><g:message code="district"/> *</label>
    <g:hasErrors bean="${consumer}" field="district">
        <g:eachError bean="${consumer}" field="district">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
    <g:textField name="district" class="form-control" value="${fieldValue(bean: consumer, field: 'district')}" placeholder="Please Enter District"/>
</div>

<div class="form-group">
    <label><g:message code="street"/> *</label>
    <g:hasErrors bean="${consumer}" field="street">
        <g:eachError bean="${consumer}" field="street">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
    <g:textField name="street" class="form-control" value="${fieldValue(bean: consumer, field: 'street')}" placeholder="Please Enter Street"/>
</div>

<div class="form-group">
    <label><g:message code="house.number"/> *</label>
    <g:hasErrors bean="${consumer}" field="houseNumber">
        <g:eachError bean="${consumer}" field="houseNumber">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
    <g:field type="number" name="houseNumber" class="form-control" value="${fieldValue(bean: consumer, field: 'houseNumber')}" placeholder="Please Enter House Number"/>
</div>

<div class="form-group">
    <label><g:message code="cp"/> *</label>
    <g:hasErrors bean="${consumer}" field="cp">
        <g:eachError bean="${consumer}" field="cp">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
    <g:field type="number" name="cp" class="form-control" value="${fieldValue(bean: consumer, field: 'cp')}" placeholder="Please Enter Postal Code"/>
</div>

<div class="form-group">
    <label><g:message code="phone.number"/> *</label>
    <g:hasErrors bean="${consumer}" field="phoneNumber">
        <g:eachError bean="${consumer}" field="phoneNumber">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
    <g:field type="number" name="phoneNumber" class="form-control" value="${fieldValue(bean: consumer, field: 'phoneNumber')}" placeholder="Please Enter phone number"/>
</div>

<div class="form-group">
    <label><g:message code="phone.type"/> *</label>
    <g:hasErrors bean="${consumer}" field="phoneType">
        <g:eachError bean="${consumer}" field="phoneType">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
    <g:select name="phoneType"
              from="${['cell', 'house']}"
              value="${fieldValue(bean: consumer, field: 'phoneType')}"
    />
</div>