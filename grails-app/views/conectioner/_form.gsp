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

