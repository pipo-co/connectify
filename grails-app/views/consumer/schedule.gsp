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
    <v-calendar
            ref="calendar"
    %{--        v-model="focus"--}%
            color="primary"
            :events="events"
            event-color="red"
            type="month"
    %{--        @click:event="showEvent"--}%
    %{--        @click:more="viewDay"--}%
    %{--        @click:date="window"--}%
            @change="events = window.updateRange($event, subscribedActivities)"
    ></v-calendar>
</div>
<div v-else>
    <p>Loading...</p>
</div>

</body>

</html>