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
            <p class="headline">  <g:message code="activities" args="['List Of']"/></p>
        </v-col>
    </v-row>
    <v-row wrap>
        <g:each in="${activityList}" var="info">
            <v-col>
                <v-card  class="mx-auto"
                         max-width="400">
                    <v-container fluid class="pa-0">
                        <v-img
                                src="https://cdn.vuetifyjs.com/images/cards/house.jpg"
                                gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                                height="160px"
                        >
                            <v-row no-gutters align="center" class="pl-1 py-0">
                                <v-col cols="10" class="pa-0">
                                    <v-card-subtitle class="pa-0 white--text">Category: ${info.activityTemplate.category.name}</v-card-subtitle>
                                    <v-card-title class="pa-0  white--text"> ${info.activityTemplate.name}</v-card-title>
                                </v-col>
                                <v-col cols="2" class="pa-0">
                                    <v-btn icon color="#59D0B4" class="pa-0" >
                                        <v-icon>
                                            mdi-heart
                                        </v-icon>
                                    </v-btn>
                                </v-col>
                            </v-row>
                        </v-img>
                    </v-container>
                    <v-card-actions class="pa-0">
                        <v-container fluid class="pa-1">
                            <v-row align="center">
                                <v-col cols="9" class="pa-1">
                                    <v-card-title class="cyan--text ml-3 pa-2"  >By:${info.activityTemplate.conectioner.user.username}</v-card-title>
                                </v-col>
                            </v-row>
                            <v-row align="center">
                                <v-col class="pa-1">
                                    <p class="ml-5">${info.activityTemplate.description}</p>
                                </v-col>
                            </v-row>
                            <v-divider></v-divider>
                            <v-row align="center">
                                <v-col class="pa-0" >
                                    <p class="subtitle-1 ml-5 my-0 py-1">Address: ${info.activityTemplate.address}</p>
                                </v-col>
                            </v-row>
                            <v-row align="center">
                                <v-col class="pa-0" >
                                    <p class="headline ml-5 my-0">Availability:</p>
                                </v-col>
                            </v-row>
                            <v-row align="center">
                                <v-col class="pa-0">
                                    <p class="ml-5 my-0 text-center">Participants:${info.participants}/${info.activityTemplate.maxParticipants}</p>
                                </v-col>
                            </v-row>
                            <v-row align="center">
                                <v-col class="pa-0" >
                                    <p class="ml-5 my-0 text-center">Starts:${info.initDate} at ${info.initTime}</p>
                                </v-col>
                            </v-row>
                            <v-row class="pa-0 ma-0">
                                <v-col class="pa-0 ma-0">
                                    <v-list>
                                        <v-list-item>
                                            <v-btn color="#59D0B4" class="mx-auto" href="${createLink(controller: 'activity', action: 'details', id: info.id)}">
                                                Detail
                                            </v-btn>
                                            %{--<v-btn color="#59D0B4" class="mx-auto" href="${createLink(controller: 'activityTemplate', action: 'edit', id: info.id)}">
                                                Edit
                                            </v-btn>--}%
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


