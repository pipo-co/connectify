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
                <g:message code="create"/> new activity
            </v-btn>
        </v-col>
    </v-row>
    <v-row wrap>
        <g:each in="${activityTList}" var="info">
            <v-col>
                <v-card color="#1d1e33" class="mx-auto" width="450" max-width="450" max-height="420">
                    <v-container fluid class="pa-0">
                        <v-img
                                src="${assetPath(src: info.category.randStockImgPath())}"
                                gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                                height="150px"
                        >
                        </v-img>
                    </v-container>
                    <v-card-actions class="pa-0">
                        <v-container fluid class="pa-1">
                            <v-row no-gutters align="center" class="pl-1 py-0">
                                <v-col cols="10" class="pa-0">
                                    <p style="text-overflow:ellipsis; white-space: nowrap; overflow: hidden;" class="pa-0 text-left white--text headline"> ${info?.name}</p>
                                </v-col>
                            </v-row>
                            <v-row>
                                <v-col  class="pa-0">
                                    <v-card-subtitle class=" text-left white--text"> ${info?.description}</v-card-subtitle>
                                </v-col>
                            </v-row>
                            <v-divider dark></v-divider>
                            <v-row align="center">
                                <v-col class="pa-0" >
                                    <p class="subtitle-1 white--text ml-5 my-0 py-1">Max Participants: ${info?.maxParticipants}</p>
                                </v-col>
                                <v-col class="pa-0" >
                                    <p class="subtitle-1 white--text ml-5 my-0 py-1">Duration: ${info?.duration} min</p>
                                </v-col>
                            </v-row>
                            <v-row>
                                <v-col class="pa-1">
                                    <v-btn color="#59D0B4" class="mx-auto" href="${createLink(controller: 'activity', action: 'create', id: info.id)}" >
                                        Start Activity
                                    </v-btn>
                                    <v-btn color="#59D0B4" class="mx-auto" href="${createLink(controller: 'activity', action: 'index', id: info.id)}">
                                        List Activities
                                    </v-btn>
                                    <v-btn color="red" class="mx-auto" href="${createLink(controller: 'activityTemplate', action: 'delete', id: info.id)}">
                                        Delete
                                    </v-btn>
                                </v-col>
                            </v-row>
                        </v-container>
                    </v-card-actions>
                </v-card>
            </v-col>
        </g:each>
    </v-row>
</v-container>