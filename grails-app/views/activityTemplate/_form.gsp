<v-card color="#1d1e33" width="800" class="ma-auto">
    <v-container>
        %{-- Name--}%
        <v-row >
            <v-col class="py-0">
                <g:hasErrors bean="${activityT}" field="name">
                    <g:eachError bean="${activityT}" field="name">
                        <p class='red--text text--darken--1'><span><g:message error="${it}"/></span></p>
                    </g:eachError>
                </g:hasErrors>
                <v-text-field
                        dark
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
            <v-col class="py-0">
                <g:hasErrors bean="${activityT}" field="description">
                    <g:eachError bean="${activityT}" field="description">
                        <p class='red--text text--darken--1'><span><g:message error="${it}"/></span></p>
                    </g:eachError>
                </g:hasErrors>
                <v-text-field
                        dark
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
            <v-col class="py-0">
                <g:hasErrors bean="${activityT}" field="duration">
                    <g:eachError bean="${activityT}" field="duration">
                        <p class='red--text text--darken--1'><span><g:message error="${it}"/></span></p>
                    </g:eachError>
                </g:hasErrors>
                <v-text-field
                        dark
                        label="<g:message code="duration"/>"
                        name="duration"
                        type="number"
                        suffix="minutes"
                        value="${fieldValue(bean: activityT, field: 'duration')}"
                        required
                >
                </v-text-field>
            </v-col>
        </v-row>
        %{-- Address--}%
        <v-row>
            <v-col class="py-0">
                <g:hasErrors bean="${activityT}" field="address">
                    <g:eachError bean="${activityT}" field="address">
                        <p class='red--text text--darken--1'><span><g:message error="${it}"/></span></p>
                    </g:eachError>
                </g:hasErrors>
                <g:hasErrors bean="${activityT}" field="latitude">
                    <g:eachError bean="${activityT}" field="latitude">
                        <p class='red--text text--darken--1'><span><g:message error="${it}"/></span></p>
                    </g:eachError>
                </g:hasErrors>
                <g:hasErrors bean="${activityT}" field="longitude">
                    <g:eachError bean="${activityT}" field="longitude">
                        <p class='red--text text--darken--1'><span><g:message error="${it}"/></span></p>
                    </g:eachError>
                </g:hasErrors>
                <v-text-field
                        dark
                        class="indigo--text"
                        id="address"
                        label="<g:message code="address"/>"
                        name="address"
                        value="${fieldValue(bean: activityT, field: 'address')}"
                        required
                >
                </v-text-field>
            </v-col>
        </v-row>
        <g:hiddenField id="lat" name="latitude" value="${fieldValue(bean: activityT, field: 'latitude')}"/>
        <g:hiddenField id="long" name="longitude" value="${fieldValue(bean: activityT, field: 'longitude')}"/>
        %{-- Max Participants--}%
        <v-row>
            <v-col class="py-0">
                <g:hasErrors bean="${activityT}" field="maxParticipants">
                    <g:eachError bean="${activityT}" field="maxParticipants">
                        <p class='red--text text--darken--1'><span><g:message error="${it}"/></span></p>
                    </g:eachError>
                </g:hasErrors>
                <v-text-field
                        dark
                        label="<g:message code="max.participants"/>"
                        name="maxParticipants"
                        type="number"
                        value="${fieldValue(bean: activityT, field: 'maxParticipants')}"
                        required
                >
                </v-text-field>
            </v-col>
        </v-row>

        <v-row>
            <v-col class="py-0">
                <g:hasErrors bean="${activityT}" field="category">
                    <g:eachError bean="${activityT}" field="category">
                        <p class='red--text text--darken--1'><span><g:message error="${it}"/></span></p>
                    </g:eachError>
                </g:hasErrors>
                <v-select
                        dark
                        label="<g:message code="category"/>"
                        name="categoryId"
                        :value="${activityT?.category != null ? fieldValue(bean: activityT?.category, field: 'id') : -1}"
                        :items="categories"
                        required
                ></v-select>
            </v-col>
        </v-row>
    </v-container>
</v-card>