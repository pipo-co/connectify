<v-card width="800" class="ma-auto">
    <v-container>
        %{-- Name--}%
        <v-row >
            <v-col class="pa-0">
                <g:hasErrors bean="${activityT}" field="name">
                    <g:eachError bean="${activityT}" field="name">
                        <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                    </g:eachError>
                </g:hasErrors>
                <v-text-field
                        label="<g:message code="name"/>"
                        name="name"
                        value="${fieldValue(bean: activityT, field: 'name')}"
                        required
                >
                </v-text-field>
            </v-col>
        </v-row>
        %{-- Description--}%
        <v-row>
            <v-col class="pa-0">
                <g:hasErrors bean="${activityT}" field="description">
                    <g:eachError bean="${activityT}" field="description">
                        <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                    </g:eachError>
                </g:hasErrors>
                <v-text-field
                        label="<g:message code="description"/>"
                        name="description"
                        value="${fieldValue(bean: activityT, field: 'description')}"
                        required
                >
                </v-text-field>
            </v-col>
        </v-row>
        %{-- Duration--}%
        <v-row>
            <v-col class="pa-0">
                <g:hasErrors bean="${activityT}" field="duration">
                    <g:eachError bean="${activityT}" field="duration">
                        <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                    </g:eachError>
                </g:hasErrors>
                <v-text-field
                        label="<g:message code="duration"/>"
                        name="duration"
                        value="${fieldValue(bean: activityT, field: 'duration')}"
                        required
                >
                </v-text-field>
            </v-col>
        </v-row>
        %{-- Address--}%
        <v-row>
            <v-col class="pa-0">
                <g:hasErrors bean="${activityT}" field="address">
                    <g:eachError bean="${activityT}" field="address">
                        <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                    </g:eachError>
                </g:hasErrors>
                <v-text-field
                        label="<g:message code="address"/>"
                        name="address"
                        value="${fieldValue(bean: activityT, field: 'address')}"
                        required
                >
                </v-text-field>
            </v-col>
        </v-row>
        %{-- Max Participants--}%
        <v-row>
            <v-col class="pa-0">
                <g:hasErrors bean="${activityT}" field="max.participants">
                    <g:eachError bean="${activityT}" field="max.participants">
                        <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                    </g:eachError>
                </g:hasErrors>
                <v-text-field
                        label="<g:message code="max.participants"/>"
                        name="maxParticipants"
                        value="${fieldValue(bean: activityT, field: 'maxParticipants')}"
                        required
                >
                </v-text-field>
            </v-col>
        </v-row>

        <v-row>
            <v-col class="pa-0">
                <g:hasErrors bean="${activityT}" field="category">
                    <g:eachError bean="${activityT}" field="category">
                        <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                    </g:eachError>
                </g:hasErrors>
                <v-select
                        label="<g:message code="category"/>"
                        name="category"
                        value="${fieldValue(bean: activityT, field: 'category')}"
                        :items="categories"
                        required
                ></v-select>
            </v-col>
        </v-row>
    </v-container>
</v-card>