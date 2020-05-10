<v-container>
    <v-row>
        <v-col class="pa-0">
            <g:hasErrors bean="${conectioner}" field="user.username">
                <g:eachError bean="${conectioner}" field="user.username">
                    <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                </g:eachError>
            </g:hasErrors>
            <v-text-field
                    label="<g:message code="username"/>"
                    name="username"
                    value="${fieldValue(bean: conectioner?.user, field: 'username')}"
                    required
            ></v-text-field>
        </v-col>
      </v-row>
        <v-row>
            <v-col class="pa-0">
                <g:hasErrors bean="${conectioner}" field="user.name">
                <g:eachError bean="${conectioner}" field="user.name">
                    <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                </g:eachError>
            </g:hasErrors>
                <v-text-field
                        label="<g:message code="name"/>"
                        name="name"
                        value="${conectioner?.user?.name}"
                        required
                >
                </v-text-field>
            </v-col class="pa-0">
        </v-row>
    <v-row>
    <v-col class="pa-0">
        <g:hasErrors bean="${conectioner?.user}" field="email">
            <g:eachError bean="${conectioner?.user}" field="email">
                <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
            </g:eachError>
        </g:hasErrors>
        <v-text-field
                v-model="email"
                label="<g:message code="email.address"/>"
                name="email"
                type="email"
                :rules="emailRules"
                value="${conectioner?.user?.email}"
                required
        >
        </v-text-field>
    </v-col>
</v-row>
<v-row>
    <v-col class="pa-0">
        <g:if test="${!edit}">
            <g:hasErrors bean="${conectioner?.user}" field="password">
                <g:eachError bean="${conectioner?.user}" field="password">
                    <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                </g:eachError>
            </g:hasErrors>
            <v-text-field
                    v-model="password"
                    label="<g:message code="password"/>"
                    name="password"
                    type="password"
                    value="${conectioner?.user?.password}"
                    hint="At least 8 characters"
            ></v-text-field>
        </g:if>
    </v-col>
</v-row>
 <v-row>
     <v-col class="pa-0">
         <g:hasErrors bean="${conectioner}" field="cbu">
             <g:eachError bean="${conectioner}" field="cbu">
                 <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
             </g:eachError>
         </g:hasErrors>
         <v-text-field
                 label="<g:message code="cbu"/>"
                 name="avatar"
                 hint="22 characters"
                 value="${fieldValue(bean: conectioner, field: 'cbu')}"
         ></v-text-field>
     </v-col>
 </v-row>

    <v-row>
        <v-col class="pa-0">
            <g:if test="${!edit}">
                <v-file-input accept="image/*"  name="avatar" label="<g:message code="avatar"/>" prepend-icon="mdi-camera"></v-file-input>
            </g:if>
        </v-col>
    </v-row>
</v-container>


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
