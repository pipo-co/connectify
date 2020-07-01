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
%{--    <v-calendar--}%
%{--            ref="calendar"--}%
%{--    --}%%{--        v-model="focus"--}%
%{--            color="primary"--}%
%{--            :events="events"--}%
%{--            event-color="red"--}%
%{--            type="month"--}%
%{--    --}%%{--        @click:event="showEvent"--}%
%{--    --}%%{--        @click:more="viewDay"--}%
%{--    --}%%{--        @click:date="window"--}%
%{--            @change="events = window.updateRange($event, subscribedActivities)"--}%
%{--    ></v-calendar>--}%

    <v-row class="fill-height">
        <v-col>
            <v-sheet height="64">
                <v-toolbar flat color="white">
%{--                    <v-btn outlined class="mr-4" color="grey darken-2" @click="setToday">--}%
%{--                        Today--}%
%{--                    </v-btn>--}%
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
                </v-toolbar>
            </v-sheet>
            <v-sheet height="600">
                <v-calendar
                        ref="calendar"
                        v-model="focus"
                        color="primary"
                        :events="events"
                        event-color="red"
                        type="month"
                        @click:event="window.goToActivity($event)"
%{--                        @click:more="viewDay"--}%
%{--                        @click:date="viewDay"--}%
                        @change="events = window.updateRange($event, subscribedActivities)"
                ></v-calendar>
%{--                <v-menu
                        v-model="selectedOpen"
                        :close-on-content-click="false"
                        :activator="selectedElement"
                        offset-x
                >
                    <v-card
                            color="grey lighten-4"
                            min-width="350px"
                            flat
                    >
                        <v-toolbar
                                :color="selectedEvent.color"
                                dark
                        >
                            <v-btn icon>
                                <v-icon>mdi-pencil</v-icon>
                            </v-btn>
                            <v-toolbar-title v-html="selectedEvent.name"></v-toolbar-title>
                            <v-spacer></v-spacer>
                            <v-btn icon>
                                <v-icon>mdi-heart</v-icon>
                            </v-btn>
                            <v-btn icon>
                                <v-icon>mdi-dots-vertical</v-icon>
                            </v-btn>
                        </v-toolbar>
                        <v-card-text>
                            <span v-html="selectedEvent.details"></span>
                        </v-card-text>
                        <v-card-actions>
                            <v-btn
                                    text
                                    color="secondary"
                                    @click="selectedOpen = false"
                            >
                                Cancel
                            </v-btn>
                        </v-card-actions>
                    </v-card>
                </v-menu>
            </v-sheet>
        </v-col>
    </v-row>
--}%


</div>
<div v-else>
    <p>Loading...</p>
</div>

</body>

</html>