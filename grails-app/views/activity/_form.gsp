<v-card color="#1d1e33" width="800" class="ma-auto">
    <v-container>
        %{-- Name--}%
        <v-row align="center">
            <v-col class="py-0" cols="12">
                <g:hasErrors bean="${activity}" field="initDate">
                    <g:eachError bean="${activity}" field="initDate">
                        <p class='red--text text--darken--1'><span><g:message error="${it}"/></span></p>
                    </g:eachError>
                </g:hasErrors>
                <g:hasErrors bean="${activity}" field="initTime">
                    <g:eachError bean="${activity}" field="initTime">
                        <p class='red--text text--darken--1'><span><g:message error="${it}"/></span></p>
                    </g:eachError>
                </g:hasErrors>
            </v-col>

            <v-col class="py-0">
                <v-date-picker
                        dark
                        v-model="picker"
                        year-icon="mdi-calendar-blank"
                        prev-icon="mdi-skip-previous"
                        next-icon="mdi-skip-next"
                ></v-date-picker>
            </v-col>
            <v-col class="py-0">
                <v-time-picker dark v-model="timePicker" format="24hr"></v-time-picker>
            </v-col>

        </v-row>
        %{-- Description--}%
        <input type="hidden" name="initDate" v-model="picker">
        <input type="hidden" name="initTime" v-model="timePicker">
        <g:hiddenField name="activityTId" value="${activityTId}" />
    </v-container>
</v-card>