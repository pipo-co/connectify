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










