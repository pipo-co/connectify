<%--
  Created by IntelliJ IDEA.
  User: tobias
  Date: 1/7/20
  Time: 13:34
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Schedule</title>
    <meta name="layout" content="main"/>
    <asset:javascript src="schedule.js" id="tobias" />
</head>

<body>

<div v-if="subscribedActivities != null">
    <v-container>
        <v-row justify="center">
            <v-col cols="8">
                <h1>Proximas actividades</h1>

                <v-sheet height="64">
                    <v-toolbar flat color="white">
                        <v-btn outlined class="mr-4" color="grey darken-2" @click="focus = ''">
                            Today
                        </v-btn>
                        <v-btn fab text small color="grey darken-2" @click="$refs.calendar.prev()">
                            <v-icon small>mdi-chevron-left</v-icon>
                        </v-btn>
                        <v-btn fab text small color="grey darken-2" @click="$refs.calendar.next()">
                            <v-icon small>mdi-chevron-right</v-icon>
                            </v-btn>
                        <v-toolbar-title v-if="$refs.calendar">
                            {{ $refs.calendar.title }}
                        </v-toolbar-title>
                        <v-spacer></v-spacer>
                        <v-btn v-show="calendarType == 'day'" outlined class="mr-4" color="grey darken-2" @click="calendarType = 'month'">
                            Volver
                        </v-btn>
                    </v-toolbar>
                </v-sheet>
                <v-sheet height="600">
                    <v-calendar
                            ref="calendar"
                            v-model="focus"
                            color="primary"
                            :events="events"
                            event-color="#baffc9"
                            event-text-color="black"
                            :type="calendarType"
                            @click:event="window.goToActivity($event)"
                            @click:date="({date}) => { this.focus = date; this.calendarType = 'day';}"
                            @click:more="({date}) => { this.focus = date; this.calendarType = 'day';}"
                            @change="events = window.updateRange($event, subscribedActivities)"
                    ></v-calendar>
                </v-sheet>
            </v-col>
        </v-row>
    </v-container>
</div>
<div v-else>
    <p>Loading...</p>
</div>

</body>

</html>