<v-card width="800" class="ma-auto">
<v-container >
    %{-- Username   --}%
    <v-row >
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
    %{-- Name and Lastname   --}%
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
    %{-- Email   --}%
    <v-row>
        <v-col class="pa-0">
            <g:hasErrors bean="${consumer}" field="user.email">
                <g:eachError bean="${consumer}" field="user.email">
                    <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                </g:eachError>
            </g:hasErrors>
            <v-text-field
%{--                    v-model="email"--}%
                    label="<g:message code="email.address"/>"
                    name="email"
                    type="email"
%{--                    :rules="emailRules"--}%
                    value="${consumer?.user?.email}"
                    required
            >
            </v-text-field>
        </v-col>
    </v-row>
    %{-- Password   --}%
    <v-row>
        <v-col class="pa-0">
        <g:if test="${!edit}">
                <g:hasErrors bean="${consumer}" field="user.password">
                    <g:eachError bean="${consumer}" field="user.password">
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
    %{-- Avatar   --}%
    <v-row>
        <v-col class="pa-0">
            <g:if test="${!edit}">
                <v-file-input accept="image/*"  name="avatar" label="<g:message code="avatar"/>" prepend-icon="mdi-camera"></v-file-input>
            </g:if>
        </v-col>
    </v-row>
    %{-- DocType   --}%
    <v-row>
        <v-col class="pa-0">
            <g:hasErrors bean="${consumer}" field="docType">
                <g:eachError bean="${consumer}" field="docType">
                    <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                </g:eachError>
            </g:hasErrors>
            <v-select
                    label="<g:message code="doc.type"/>"
                    name="docType"
                    value="${fieldValue(bean: consumer, field: 'docType')}"
                    :items="docTypes"
                    required
            ></v-select>
        </v-col>
    </v-row>
    %{-- Document   --}%
    <v-row>
        <v-col class="pa-0">
            <g:hasErrors bean="${consumer}" field="document">
            <g:eachError bean="${consumer}" field="document">
                <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
            </g:eachError>
            </g:hasErrors>
            <v-text-field
                    label="<g:message code="document"/>"
                    name="document"
                    value="${fieldValue(bean: consumer, field: 'document')}"
                    required
            >
            </v-text-field>
        </v-col>
    </v-row>
    %{-- Country   --}%
    <v-row>
        <v-col class="pa-0">
            <g:hasErrors bean="${consumer}" field="country">
                <g:eachError bean="${consumer}" field="country">
                    <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                </g:eachError>
            </g:hasErrors>
            <v-select
                    label="<g:message code="country"/>"
                    name="country"
                    value="${fieldValue(bean: consumer, field: 'country')}"
                    :items="countries"
                    @change="getProvinces($event)"
                    required
            ></v-select>
        </v-col>
    </v-row>
    %{-- Province   --}%
    <v-row>
        <v-col class="pa-0">
            <g:hasErrors bean="${consumer}" field="province">
                <g:eachError bean="${consumer}" field="province">
                    <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                </g:eachError>
            </g:hasErrors>
            <v-select
                    label="<g:message code="province"/>"
                    name="province"
                    value="${fieldValue(bean: consumer, field: 'province')}"
                    :items="provinces"
                    required
            ></v-select>
        </v-col>
    </v-row>
    %{-- District   --}%
    <v-row>
        <v-col class="pa-0">
            <g:hasErrors bean="${consumer}" field="district">
                <g:eachError bean="${consumer}" field="district">
                    <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                </g:eachError>
            </g:hasErrors>
            <v-text-field
                    label="<g:message code="district"/>"
                    name="district"
                    value="${fieldValue(bean: consumer, field: 'district')}"
                    required
            >
            </v-text-field>
        </v-col>
    </v-row>
    %{-- Street   --}%
    <v-row>
        <v-col class="pa-0">
            <g:hasErrors bean="${consumer}" field="street">
                <g:eachError bean="${consumer}" field="street">
                    <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                </g:eachError>
            </g:hasErrors>
            <v-text-field
                    label="<g:message code="street"/>"
                    name="street"
                    value="${fieldValue(bean: consumer, field: 'street')}"
                    required
            >
            </v-text-field>
        </v-col>
    </v-row>
    %{-- HouseNumber   --}%
    <v-row>
        <v-col class="pa-0">
            <g:hasErrors bean="${consumer}" field="houseNumber">
                <g:eachError bean="${consumer}" field="houseNumber">
                    <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                </g:eachError>
            </g:hasErrors>
            <v-text-field
                    label="<g:message code="house.number"/>"
                    name="houseNumber"
                    type="number"
                    value="${fieldValue(bean: consumer, field: 'houseNumber')}"
                    required
            >
            </v-text-field>
        </v-col>
    </v-row>
    %{-- Cp   --}%
    <v-row>
        <v-col class="pa-0">
            <g:hasErrors bean="${consumer}" field="cp">
                <g:eachError bean="${consumer}" field="cp">
                    <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                </g:eachError>
            </g:hasErrors>
            <v-text-field
                    label="<g:message code="cp"/>"
                    name="cp"
                    type="number"
                    value="${fieldValue(bean: consumer, field: 'cp')}"
                    required
            >
            </v-text-field>
        </v-col>
    </v-row>
    %{-- Phone number   --}%
    <v-row>
        <v-col class="pa-0">
            <g:hasErrors bean="${consumer}" field="phoneNumber">
                <g:eachError bean="${consumer}" field="phoneNumber">
                    <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                </g:eachError>
            </g:hasErrors>
            <v-text-field
                    label="<g:message code="phone.number"/>"
                    name="phoneNumber"
                    type="number"
                    value="${fieldValue(bean: consumer, field: 'phoneNumber')}"
                    required
            >
            </v-text-field>
        </v-col>
    </v-row>
    %{-- PhoneType   --}%
    <v-row>
        <v-col class="pa-0">
            <g:hasErrors bean="${consumer}" field="phoneType">
                <g:eachError bean="${consumer}" field="phoneType">
                    <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                </g:eachError>
            </g:hasErrors>
            <v-select
                    label="<g:message code="phone.type"/>"
                    name="phoneType"
                    value="${fieldValue(bean: consumer, field: 'phoneType')}"
                    :items="phoneTypes"
                    required
            ></v-select>
        </v-col>
    </v-row>

</v-container>
</v-card>