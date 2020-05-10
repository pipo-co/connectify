<v-container>
    <v-row>
        <v-col class="pa-0">
            <g:hasErrors bean="${consumer}" field="user.username">
                <g:eachError bean="${consumer}" field="user.username">
                    <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                </g:eachError>
            </g:hasErrors>
            <v-text-field
                    label="<g:message code="username"/>"
                    name="username"
                    value="${fieldValue(bean: consumer?.user, field: 'username')}"
                    required
            >
            </v-text-field>
        </v-col>
    </v-row>
    <v-row>
        <v-col class="pa-0" cols="5">
            <g:hasErrors bean="${consumer}" field="user.name">
                <g:eachError bean="${consumer}" field="user.name">
                    <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                </g:eachError>
            </g:hasErrors>
            <v-text-field
                    label="<g:message code="name"/>"
                    name="name"
                    value="${consumer?.user?.name}"
                    required
            >
            </v-text-field>
        </v-col>
        <v-col cols="1"><v-spacer></v-spacer></v-col>
        <v-col class="pa-0 ml-3" >
            <g:hasErrors bean="${consumer}" field="lastName">
                <g:eachError bean="${consumer}" field="lastName">
                    <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                </g:eachError>
            </g:hasErrors>
            <v-text-field
                    v-model="password"
                    label="<g:message code="last.name"/>"
                    name="lastName"

                    value="${fieldValue(bean: consumer, field: 'lastName')}"
            ></v-text-field>
        </v-col>
    </v-row>
    <v-row>
        <v-col class="pa-0">
            <g:hasErrors bean="${consumer?.user}" field="email">
                <g:eachError bean="${consumer?.user}" field="email">
                    <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                </g:eachError>
            </g:hasErrors>
            <v-text-field
                    v-model="email"
                    label="<g:message code="email.address"/>"
                    name="email"
                    type="email"
                    :rules="emailRules"
                    value="${consumer?.user?.email}"
                    required
            >
            </v-text-field>
        </v-col>
    </v-row>
    <v-row>
        <v-col class="pa-0">
        <g:if test="${!edit}">
                <g:hasErrors bean="${consumer?.user}" field="password">
                    <g:eachError bean="${consumer?.user}" field="password">
                        <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                    </g:eachError>
                </g:hasErrors>
                <v-text-field
                        v-model="password"
                        label="<g:message code="password"/>"
                        name="password"
                        type="password"
                        value="${consumer?.user?.password}"
                        hint="At least 8 characters"
                ></v-text-field>
        </g:if>
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





<div class="form-group">
    <label><g:message code="last.name"/> *</label>
    <g:hasErrors bean="${consumer}" field="lastName">
        <g:eachError bean="${consumer}" field="lastName">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
    <g:textField name="lastName" class="form-control" value="${fieldValue(bean: consumer, field: 'lastName')}" placeholder="Please Enter Last Name"/>
</div>

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