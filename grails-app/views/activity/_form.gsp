<v-card color="#1d1e33" width="800" class="ma-auto">
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
                            dark
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
                    <v-time-picker dark v-model="timePicker" format="24hr"></v-time-picker>

            </v-row>

    </v-row>
        %{-- Description--}%
        <input type="hidden" name="initDate" v-model="picker">
        <input type="hidden" name="initTime" v-model="timePicker">
        <g:hiddenField name="activityTId" value="${activityTId}" />
    </v-container>
</v-card>