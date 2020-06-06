<%--
  Created by IntelliJ IDEA.
  User: tobias
  Date: 30/4/20
  Time: 23:43
--%>

%{--Include Main Layout--}%
<meta name="layout" content="main"/>
<v-container class="my-2">
    <v-row>
        <v-col cols="8">
            <p class="headline"> <g:message code="activity.template" args="['List Of']"/>:</p>
        </v-col>
        <v-col>
            <v-btn color="#2E3047" class="white--text" href="/activityTemplate/create">
                <g:message code="create"/> new activity template
            </v-btn>
        </v-col>
    </v-row>
    <v-row wrap>
        <g:each in="${activityTList}" var="info">
            <v-col>
                <v-card  class="mx-auto"
                         max-width="400"
                >
                    <v-container fluid class="pa-0">
                        <v-img
                                src="https://cdn.vuetifyjs.com/images/cards/house.jpg"
                                gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                                height="160px"
                        >
                            <v-row no-gutters align="center" class="pl-1 py-0">
                                <v-col cols="10" class="pa-0">
                                    <v-card-title class="pa-0  white--text"> ${info?.name}</v-card-title>
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
                                <v-col class="pa-1" >
                                    <p class="ml-5" >Description: ${info?.description}</p>
                                </v-col>
                            </v-row>
                            <v-divider></v-divider>
                            <v-row align="center">
                                <v-col class="pa-0" >
                                    <p class="subtitle-1 ml-5 my-0 py-1">Max Participants: ${info?.maxParticipants}</p>
                                </v-col>
                                <v-col class="pa-0" >
                                    <p class="subtitle-1 ml-5 my-0 py-1">Duration: ${info?.duration}</p>
                                </v-col>
                            </v-row>
                            <v-row wrap>
                                <v-col>
                                    <v-list>
                                        <v-list-item>
                                            <v-list-item-title>Actions</v-list-item-title>
                                        </v-list-item>
                                        <v-list-item>
                                            <v-btn color="#59D0B4" class="mx-auto" href="${createLink(controller: 'activity', action: 'create', id: info.id)}" >
                                                Start Activity
%{--                                                <g:link controller="activity" action="create" class="btn btn-secondary" id="${info.id}"></g:link>--}%
                                            </v-btn>
                                            <v-btn color="#59D0B4" class="mx-auto" href="${createLink(controller: 'activity', action: 'index', id: info.id)}">
                                                List Activities
                                            </v-btn>
                                        </v-list-item>
                                        <v-list-item>
                                            <v-btn color="#59D0B4" class="mx-auto" href="${createLink(controller: 'activityTemplate', action: 'details', id: info.id)}">
                                                Detail
                                            </v-btn>
                                            <v-btn color="#59D0B4" class="mx-auto" href="${createLink(controller: 'activityTemplate', action: 'edit', id: info.id)}">
                                                Edit
                                                </v-btn>
                                            <v-btn color="red" class="mx-auto" href="${createLink(controller: 'activityTemplate', action: 'delete', id: info.id)}">
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
</div>