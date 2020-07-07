<%--
  Created by IntelliJ IDEA.
  User: tobias
  Date: 30/4/20
  Time: 23:43
--%>

%{--Include Main Layout--}%
<meta name="layout" content="main"/>
<v-container class="my-2">
    <v-row justify="start">
        <v-col>
            <p class="headline"><g:message code="activities" args="['List Of']"/></p>
        </v-col>
    </v-row>
    <v-row wrap>
        <g:each in="${activityList}" var="info">
            <v-col>
                <v-card color="#1d1e33" class="mx-auto" max-width="400">
                    <v-container fluid class="pa-0">
                        <v-img
                                src="https://cdn.vuetifyjs.com/images/cards/house.jpg"
                                gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                                height="160px"
                        >
                            <v-row no-gutters align="center" class="pl-1 py-0">
                                <v-col cols="10" class="pa-0">
                                    <v-card-title class="subtitle-1 pa-0 white--text">Category: ${info.activityTemplate.category.name}</v-card-title>
                                    <v-card-title class="pa-0  white--text"> ${info.activityTemplate.name}</v-card-title>
                                </v-col>
                            </v-row>
                        </v-img>
                    </v-container>
                    <v-card-actions class="pa-0">
                        <v-container fluid class="pa-1">
                            <v-row no-gutters align="start" justify="start">
                                <v-col cols="9" class="pa-1">
                                    <v-card-title class="teal--text text--accent-3 ml-3 pa-2"  >By:${info.activityTemplate.conectioner.user.username}</v-card-title>
                                </v-col>
                            </v-row>
                            <v-row no-gutters align="start" justify="start">
                                <v-col class="px-2">
                                    <v-card-title class="white--text">${info.activityTemplate.description}</v-card-title>
                                </v-col>
                            </v-row>
                            <v-row no-gutters align="center">
                                <v-col class="px-2" >
                                    <v-card-title class="white--text subtitle-1 py-0">Address: ${info.activityTemplate.address}</v-card-title>
                                </v-col>
                            </v-row>
                            <v-divider dark></v-divider>
                            <v-row no-gutters align="center">
                                <v-col class="pa-0" >
                                    <p class="white--text headline ml-5 my-0">Availability:</p>
                                </v-col>
                            </v-row>
                            <v-row no-gutters align="center">
                                <v-col class="pa-0">
                                    <p class="ml-5 my-0 white--text text-center">Participants:${info.participants}/${info.activityTemplate.maxParticipants}</p>
                                </v-col>
                            </v-row>
                            <v-row no-gutters align="center">
                                <v-col class="pa-0" >
                                    <p class="ml-5 my-0 white--text text-center">Starts:${info.initDate} at ${info.initTime}</p>
                                </v-col>
                            </v-row>
                            <v-row class="pa-0 ma-0">
                                <v-col class="pa-0 ma-0">
                                    <v-list color="#1d1e33">
                                        <v-list-item>
                                            <v-btn color="#59D0B4" class="mx-auto" href="${createLink(controller: 'activity', action: 'details', id: info.id)}">
                                                Detail
                                            </v-btn>
                                            <v-btn color="red" class="mx-auto" href="${createLink(controller: 'activity', action: 'delete', id: info.id)}">
                                                Delete
                                            </v-btn>
                                        </v-list-item>
                                    </v-list>
                                </v-col>
                            </v-row>
                        </v-container>
                    </v-card-actions>
                </v-card>
            </v-col>
        </g:each>
    </v-row>
</v-container>


