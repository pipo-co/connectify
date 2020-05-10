<div class="form-group">
    <label><g:message code="init.date"/> *</label>
    <g:hasErrors bean="${activity}" field="initDate">
        <g:eachError bean="${activity}" field="initDate">
            <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
        </g:eachError>
    </g:hasErrors>
%{--    <g:renderErrors bean="${user}" field="username" as="list" />--}%
    <g:datePicker name="initDate" class="form-control" value="${fieldValue(bean: activity, field: 'initDate')}" noSelection="['':'-Choose-']" placeholder="Please Enter Activity Initial Date"/>
</div>

<g:hiddenField name="activityTId" value="${activityTId}" />



<v-card width="800" class="ma-auto">
    <v-container>
        %{-- Name--}%
        <v-row align="center">
            <v-col class="pa-0">
                <g:hasErrors bean="${activity}" field="initDate">
                    <g:eachError bean="${activity}" field="initDate">
                        <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                    </g:eachError>
                </g:hasErrors>
                <v-row justify="center">
                    <v-date-picker
                            name="date"
                            type="date"
                            v-model="picker"
                            year-icon="mdi-calendar-blank"
                            prev-icon="mdi-skip-previous"
                            next-icon="mdi-skip-next"
                    ></v-date-picker>
                </v-row>
            </v-col>
        <v-col class="pa-0">
            <g:hasErrors bean="${activityT}" field="description">
                <g:eachError bean="${activityT}" field="description">
                    <small class='form-text text-danger'><strong><g:message error="${it}"/></strong></small>
                </g:eachError>
            </g:hasErrors>
            <v-row justify="space-around">
                <v-col class="lg-offset8" md="12" lg="4">
                    <v-time-picker name="time" type="time" v-model="e7" format="24hr"></v-time-picker>
                </v-col>
            </v-row>
        </v-row>
        %{-- Description--}%
        <input type="hidden" name="date" v-model="picker">
        <input type="hidden" name="time" v-model="e7">
    </v-container>
</v-card>