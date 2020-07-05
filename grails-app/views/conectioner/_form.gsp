<v-card color="#1d1e33" width="800" class="ma-auto">
    <v-container class="pa-5">
        %{-- Username   --}%
        <v-row >
            <v-col cols="12" class="py-0">
                <g:hasErrors bean="${conectioner}" field="user.username">
                    <g:eachError bean="${conectioner}" field="user.username">
                        <p class='red--text text--darken--1'><span><g:message error="${it}"/></span></p>
                    </g:eachError>
                </g:hasErrors>
            </v-col>
            <v-col class="py-0">
                <v-text-field
                        dark
                        label="<g:message code="username"/>"
                        name="username"
                        value="${fieldValue(bean: conectioner?.user, field: 'username')}"
                        required
                >
                </v-text-field>
            </v-col>
        </v-row>
        %{-- Name   --}%
        <v-row>
            <v-col cols="12" class="py-0">
                <g:hasErrors bean="${conectioner}" field="user.name">
                    <g:eachError bean="${conectioner}" field="user.name">
                        <p class='red--text text--darken--1'><span><g:message error="${it}"/></span></p>
                    </g:eachError>
                </g:hasErrors>
            </v-col>
            <v-col class="py-0">
                <v-text-field
                        dark
                        label="<g:message code="name"/>"
                        name="name"
                        value="${fieldValue(bean: conectioner?.user, field: 'name')}"
                        required
                >
                </v-text-field>
            </v-col>
        </v-row>
        %{-- Email   --}%
        <v-row>
            <v-col cols="12" class="py-0">
                <g:hasErrors bean="${conectioner}" field="user.email">
                    <g:eachError bean="${conectioner}" field="user.email">
                        <p class='red--text text--darken--1'><span><g:message error="${it}"/></span></p>
                    </g:eachError>
                </g:hasErrors>
            </v-col>
            <v-col class="py-0">
                <v-text-field
                        dark
                        label="<g:message code="email.address"/>"
                        name="email"
                        type="email"
                        :rules="emailRules"
                        value="${fieldValue(bean: conectioner?.user, field: 'email')}"
                        required
                >
                </v-text-field>
            </v-col>
        </v-row>
        %{-- Password   --}%
        <g:if test="${!edit}">
            <v-row>
                <v-col cols="12" class="py-0">
                    <g:hasErrors bean="${conectioner}" field="user.password">
                        <g:eachError bean="${conectioner}" field="user.password">
                            <p class='red--text text--darken--1'><span><g:message error="${it}"/></span></p>
                        </g:eachError>
                    </g:hasErrors>
                </v-col>
                <v-col class="py-0">
                        <v-text-field
                                dark
                                label="<g:message code="password"/>"
                                name="password"
                                type="password"
                                @input="form.password = $event"
                                :messages="passwordMessage"
                                value="${conectioner?.user?.password}"
                                loading
                                required
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
                </v-col>
            </v-row>
        </g:if>
        %{-- Avatar   --}%
        <v-row>
            <v-col class="py-0">
%{--                <g:if test="${!edit}">--}%
                    <v-file-input
                            dark
                            accept="image/*"
                            name="avatar"
                            label="<g:message code="avatar"/>"
                            prepend-icon="mdi-camera">
                    </v-file-input>
%{--                </g:if>--}%
            </v-col>
        </v-row>
        %{-- CBU   --}%
        <v-row>
            <v-col cols="12" class="py-0">
                <g:hasErrors bean="${conectioner}" field="cbu">
                    <g:eachError bean="${conectioner}" field="cbu">
                        <p class='red--text text--darken--1'><span><g:message error="${it}"/></span></p>
                    </g:eachError>
                </g:hasErrors>
            </v-col>
            <v-col class="py-0">
                <v-text-field
                        dark
                        label="<g:message code="cbu"/>"
                        name="cbu"
                        value="${fieldValue(bean: conectioner, field: 'cbu')}"
                        required
                >
                </v-text-field>
            </v-col>
        </v-row>
        %{-- Country & Province  --}%
        <v-row>
            <v-col cols="12" class="py-0">
                <g:hasErrors bean="${conectioner}" field="country">
                    <g:eachError bean="${conectioner}" field="country">
                        <p class='red--text text--darken--1'><span><g:message error="${it}"/></span></p>
                    </g:eachError>
                </g:hasErrors>
                <g:hasErrors bean="${conectioner}" field="province">
                    <g:eachError bean="${conectioner}" field="province">
                        <p class='red--text text--darken--1'><span><g:message error="${it}"/></span></p>
                    </g:eachError>
                </g:hasErrors>
            </v-col>
            <v-col class="py-0">
                <v-select
                        dark
                        label="<g:message code="country"/>"
                        name="country"
                        value="${fieldValue(bean: conectioner, field: 'country')}"
                        :items="countries"
                        @change="getProvinces($event)"
                        required
                ></v-select>
            </v-col>
            <v-col class="py-0">
                <v-select
                        dark
                        label="<g:message code="province"/>"
                        name="province"
                        :disabled="provinces == null"
                        value="${fieldValue(bean: conectioner, field: 'province')}"
                        :items="provinces"
                        required
                ></v-select>
            </v-col>
        </v-row>
        %{-- District   --}%
        <v-row>
            <v-col cols="12" class="py-0">
                <g:hasErrors bean="${conectioner}" field="district">
                    <g:eachError bean="${conectioner}" field="district">
                        <p class='red--text text--darken--1'><span><g:message error="${it}"/></span></p>
                    </g:eachError>
                </g:hasErrors>
            </v-col>
            <v-col class="py-0">
                <v-text-field
                        dark
                        label="<g:message code="district"/>"
                        name="district"
                        value="${fieldValue(bean: conectioner, field: 'district')}"
                        required
                >
                </v-text-field>
            </v-col>
        </v-row>
        %{-- Street, HouseNumber & PC --}%
        <v-row>
            <v-col cols="12" class="py-0">
                <g:hasErrors bean="${conectioner}" field="street">
                    <g:eachError bean="${conectioner}" field="street">
                        <p class='red--text text--darken--1'><span><g:message error="${it}"/></span></p>
                    </g:eachError>
                </g:hasErrors>
                <g:hasErrors bean="${conectioner}" field="houseNumber">
                    <g:eachError bean="${conectioner}" field="houseNumber">
                        <p class='red--text text--darken--1'><span><g:message error="${it}"/></span></p>
                    </g:eachError>
                </g:hasErrors>
                <g:hasErrors bean="${conectioner}" field="cp">
                    <g:eachError bean="${conectioner}" field="cp">
                        <p class='red--text text--darken--1'><span><g:message error="${it}"/></span></p>
                    </g:eachError>
                </g:hasErrors>
            </v-col>
            <v-col class="py-0">
                <v-text-field
                        dark
                        label="<g:message code="street"/>"
                        name="street"
                        value="${fieldValue(bean: conectioner, field: 'street')}"
                        required
                >
                </v-text-field>
            </v-col>
            <v-col class="py-0" cols="3">
                <v-text-field
                        dark
                        label="<g:message code="house.number"/>"
                        name="houseNumber"
                        type="number"
                        value="${fieldValue(bean: conectioner, field: 'houseNumber')}"
                        required
                >
                </v-text-field>
            </v-col>
            <v-col class="py-0" cols="2">
                <v-text-field
                        dark
                        label="<g:message code="cp"/>"
                        name="cp"
                        type="number"
                        value="${fieldValue(bean: conectioner, field: 'cp')}"
                        required
                >
                </v-text-field>
            </v-col>
        </v-row>
        %{-- Phone type & number   --}%
        <v-row>
            <v-col cols="12" class="py-0">
                <g:hasErrors bean="${conectioner}" field="phoneType">
                    <g:eachError bean="${conectioner}" field="phoneType">
                        <p class='red--text text--darken--1'><span><g:message error="${it}"/></span></p>
                    </g:eachError>
                </g:hasErrors>
                <g:hasErrors bean="${conectioner}" field="phoneNumber">
                    <g:eachError bean="${conectioner}" field="phoneNumber">
                        <p class='red--text text--darken--1'><span><g:message error="${it}"/></span></p>
                    </g:eachError>
                </g:hasErrors>
            </v-col>
            <v-col class="py-0" cols="4">
                <v-select
                        dark
                        label="<g:message code="phone.type"/>"
                        name="phoneType"
                        value="${fieldValue(bean: conectioner, field: 'phoneType')}"
                        :items="phoneTypes"
                        required
                ></v-select>
            </v-col>
            <v-col class="py-0">
                <v-text-field
                        dark
                        label="<g:message code="phone.number"/>"
                        name="phoneNumber"
                        value="${fieldValue(bean: conectioner, field: 'phoneNumber')}"
                        required
                >
                </v-text-field>
            </v-col>
        </v-row>
    </v-container>
</v-card>