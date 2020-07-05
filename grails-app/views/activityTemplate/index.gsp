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
        <v-col cols="1">
            <p class="headline"> Activities:</p>
        </v-col>
        <v-spacer></v-spacer>
        <v-col cols="3">
            <v-btn color="#59D0B4" href="/activityTemplate/create">
                <g:message code="create"/> new activity template
            </v-btn>
        </v-col>
    </v-row>
    <v-row wrap>
        <g:each in="${activityTList}" var="info">
            <v-col>
                <v-card color="#1d1e33" class="mx-auto" max-width="400">
                    <v-container fluid class="pa-0">
                        <v-img
                                src="${assetPath(src: info.category.randStockImgPath())}"
                                gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                                height="160px"
                        >
                            <v-row no-gutters align="center" class="pl-1 py-0">
                                <v-col cols="10" class="pa-0">
                                    <v-card-title class="pa-0  white--text"> ${info?.name}</v-card-title>
                                </v-col>
                            </v-row>
                        </v-img>
                    </v-container>
                    <v-card-actions class="pa-0">
                        <v-container fluid class="pa-1">
                            <v-row align="center">
                                <v-col class="pa-1" >
                                    <p class="ml-5 white--text" >Description: ${info?.description}</p>
                                </v-col>
                            </v-row>
                            <v-divider dark></v-divider>
                            <v-row align="center">
                                <v-col class="pa-0" >
                                    <p class="subtitle-1 white--text ml-5 my-0 py-1">Max Participants: ${info?.maxParticipants}</p>
                                </v-col>
                                <v-col class="pa-0" >
                                    <p class="subtitle-1 white--text ml-5 my-0 py-1">Duration: ${info?.duration}</p>
                                </v-col>
                            </v-row>
                            <v-row>
                                <v-col>
                                    <v-list color="#1d1e33">
                                        <v-list-item>
                                            <v-list-item-title class="white--text">Actions</v-list-item-title>
                                        </v-list-item>
                                        <v-list-item>
                                            <v-btn color="#59D0B4" class="mx-auto" href="${createLink(controller: 'activity', action: 'create', id: info.id)}" >
                                                Start Activity
                                            </v-btn>
                                            <v-btn color="#59D0B4" class="mx-auto" href="${createLink(controller: 'activity', action: 'index', id: info.id)}">
                                                List Activities
                                            </v-btn>
                                        </v-list-item>
                                        <v-list-item>
                                            <v-btn color="#59D0B4" class="mx-auto" href="${createLink(controller: 'activityTemplate', action: 'details', id: info.id)}">
                                                Detail
                                            </v-btn>
%{--                                            <v-btn color="#59D0B4" class="mx-auto" href="${createLink(controller: 'activityTemplate', action: 'edit', id: info.id)}">--}%
%{--                                                Edit--}%
%{--                                            </v-btn>--}%
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