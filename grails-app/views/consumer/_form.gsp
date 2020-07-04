<v-card color="#1d1e33" width="800" class="ma-auto">
    <v-container>
        %{-- Username   --}%
        <v-row >
            <v-col class="py-0">
                <g:hasErrors bean="${consumer}" field="user.username">
                    <g:eachError bean="${consumer}" field="user.username">
                        <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                    </g:eachError>
                </g:hasErrors>
                <v-text-field
                        dark
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
            <v-col class="py-0">
                <g:hasErrors bean="${consumer}" field="user.name">
                    <g:eachError bean="${consumer}" field="user.name">
                        <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                    </g:eachError>
                </g:hasErrors>
                <v-text-field
                        dark
                        label="<g:message code="name"/>"
                        name="name"
                        value="${fieldValue(bean: consumer?.user, field: 'name')}"
                        required
                >
                </v-text-field>
            </v-col>
            <v-col class="py-0">
                <g:hasErrors bean="${consumer}" field="lastName">
                    <g:eachError bean="${consumer}" field="lastName">
                        <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                    </g:eachError>
                </g:hasErrors>
                <v-text-field
                        dark
                        label="<g:message code="last.name"/>"
                        name="lastName"
                        value="${fieldValue(bean: consumer, field: 'lastName')}"
                ></v-text-field>
            </v-col>
        </v-row>
        %{-- Email   --}%
        <v-row>
            <v-col class="py-0">
                <g:hasErrors bean="${consumer}" field="user.email">
                    <g:eachError bean="${consumer}" field="user.email">
                        <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                    </g:eachError>
                </g:hasErrors>
                <v-text-field
                        dark
                        label="<g:message code="email.address"/>"
                        name="email"
                        type="email"
                        :rules="[rules.required, rules.email]"
                        value="${fieldValue(bean: consumer?.user, field: 'email')}"
                        required
                >
%{--                    --}%
                </v-text-field>
            </v-col>
        </v-row>
        %{-- Password   --}%
        <v-row>
            <v-col class="py-0">
                <g:if test="${!edit}">
                    <g:hasErrors bean="${consumer}" field="user.password">
                        <g:eachError bean="${consumer}" field="user.password">
                            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                        </g:eachError>
                    </g:hasErrors>
                    <v-text-field
                            dark
                            label="<g:message code="password"/>"
                            name="password"
                            type="password"
                            @input="form.password = $event"
                            :messages="passwordMessage"
                            value="${consumer?.user?.password}"
                            loading
                    >
                        <template v-slot:progress>
                            <v-progress-linear
                                    :value="passwordProgress"
                                    :color="passwordProgressColor"
                                    absolute
                                    height="7"
                            ></v-progress-linear>
                        </template>
                    </v-text-field>
                </g:if>
            </v-col>
        </v-row>
        %{-- Avatar   --}%
        <v-row>
            <v-col class="py-0">
                <g:if test="${!edit}">
                    <v-file-input accept="image/*" dark name="avatar" label="<g:message code="avatar"/>" prepend-icon="mdi-camera"></v-file-input>
                </g:if>
            </v-col>
        </v-row>
        %{-- Doc Type and Number  --}%
        <v-row>
            <v-col class="py-0" cols="4">
                <g:hasErrors bean="${consumer}" field="docType">
                    <g:eachError bean="${consumer}" field="docType">
                        <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                    </g:eachError>
                </g:hasErrors>
                <v-select
                        dark
                        label="<g:message code="doc.type"/>"
                        name="docType"
                        value="${fieldValue(bean: consumer, field: 'docType')}"
                        :items="docTypes"
                        required
                ></v-select>
            </v-col>

            <v-col class="py-0">
                <g:hasErrors bean="${consumer}" field="document">
                    <g:eachError bean="${consumer}" field="document">
                        <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                    </g:eachError>
                </g:hasErrors>
                <v-text-field
                        dark
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
            <v-col class="py-0">
                <g:hasErrors bean="${consumer}" field="country">
                    <g:eachError bean="${consumer}" field="country">
                        <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                    </g:eachError>
                </g:hasErrors>
                <v-select
                        dark
                        label="<g:message code="country"/>"
                        name="country"
                        value="${fieldValue(bean: consumer, field: 'country')}"
                        :items="countries"
                        @change="getProvinces($event)"
                        required
                ></v-select>
            </v-col>
            <v-col class="py-0">
            <g:hasErrors bean="${consumer}" field="province">
                <g:eachError bean="${consumer}" field="province">
                    <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                </g:eachError>
            </g:hasErrors>
            <v-select
                    dark
                    label="<g:message code="province"/>"
                    name="province"
                    :disabled="provinces == null"
                    value="${fieldValue(bean: consumer, field: 'province')}"
                    :items="provinces"
                    required
            ></v-select>
        </v-col>
        </v-row>
        %{-- Province   --}%
        <v-row>

        </v-row>
        %{-- District   --}%
        <v-row>
            <v-col class="py-0">
                <g:hasErrors bean="${consumer}" field="district">
                    <g:eachError bean="${consumer}" field="district">
                        <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                    </g:eachError>
                </g:hasErrors>
                <v-text-field
                        dark
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
            <v-col class="py-0">
                <g:hasErrors bean="${consumer}" field="street">
                    <g:eachError bean="${consumer}" field="street">
                        <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                    </g:eachError>
                </g:hasErrors>
                <v-text-field
                        dark
                        label="<g:message code="street"/>"
                        name="street"
                        value="${fieldValue(bean: consumer, field: 'street')}"
                        required
                >
                </v-text-field>
            </v-col>
            <v-col class="py-0" cols="3">
            <g:hasErrors bean="${consumer}" field="houseNumber">
                <g:eachError bean="${consumer}" field="houseNumber">
                    <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                </g:eachError>
            </g:hasErrors>
            <v-text-field
                    dark
                    label="<g:message code="house.number"/>"
                    name="houseNumber"
                    type="number"
                    value="${fieldValue(bean: consumer, field: 'houseNumber')}"
                    required
            >
            </v-text-field>
        </v-col>
            <v-col class="py-0" cols="2">
            <g:hasErrors bean="${consumer}" field="cp">
                <g:eachError bean="${consumer}" field="cp">
                    <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                </g:eachError>
            </g:hasErrors>
            <v-text-field
                    dark
                    label="<g:message code="cp"/>"
                    name="cp"
                    type="number"
                    value="${fieldValue(bean: consumer, field: 'cp')}"
                    required
            >
            </v-text-field>
        </v-col>
        </v-row>
        %{-- HouseNumber   --}%
        <v-row>

        </v-row>
        %{-- Cp   --}%
        <v-row>

        </v-row>
        %{-- Phone number   --}%
        <v-row>
            <v-col class="py-0" cols="4">
            <g:hasErrors bean="${consumer}" field="phoneType">
                <g:eachError bean="${consumer}" field="phoneType">
                    <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                </g:eachError>
            </g:hasErrors>
            <v-select
                    dark
                    label="<g:message code="phone.type"/>"
                    name="phoneType"
                    value="${fieldValue(bean: consumer, field: 'phoneType')}"
                    :items="phoneTypes"
                    required
            ></v-select>
        </v-col>
            <v-col class="py-0">
                <g:hasErrors bean="${consumer}" field="phoneNumber">
                    <g:eachError bean="${consumer}" field="phoneNumber">
                        <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                    </g:eachError>
                </g:hasErrors>
                <v-text-field
                        dark
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

        </v-row>

    </v-container>
</v-card>