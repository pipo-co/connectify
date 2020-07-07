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
        <v-col cols="10">
            <p class=" text-left headline">Activity control panel:</p>
        </v-col>
        <v-spacer></v-spacer>
        <v-col cols="2">
            <v-btn color="#59D0B4" href="${createLink(controller: 'activity', action: 'create', id: activityTId)}">
                <g:message code="create"/> new activity
            </v-btn>
        </v-col>
    </v-row>
    <v-row wrap>
        <v-col>
            <template>
                <v-simple-table dark >
                    <template v-slot:default>
                        <thead>
                        <tr>
                            <th class="text-left">Date</th>
                            <th class="text-left">Init Time</th>
                            <th class="text-left">Participants</th>
                            <th class="text-left">Max participants</th>
                            <th class="text-left">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${activityList}" var="info">
                            <tr>
                                <td>${info.initDate}</td>
                                <td>${info.initTime}</td>
                                <td>${info.participants}</td>
                                <td>${info.activityTemplate.maxParticipants}</td>
                                <td class="text-left"><v-btn start text class="mx-auto" href="${createLink(controller: 'activity', action: 'delete', id: info.id)}">
                                    <v-icon>mdi-delete</v-icon>
                                </v-btn></td>
                            </tr>
                        </g:each>
                        </tbody>
                    </template>
                </v-simple-table>
            </template>
        </v-col>
    </v-row>
</v-container>



