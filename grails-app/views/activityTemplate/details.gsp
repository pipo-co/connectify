<meta name="layout" content="main"/>
<v-card  class="mx-auto"
         width="1200">
    <v-container fluid class="pa-0">
        <v-img
                src="https://cdn.vuetifyjs.com/images/cards/house.jpg"
                gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                height="160px"
        ></v-img>
    </v-container>
    <v-card-actions class="pa-0">
        <v-container fluid class="pa-1">
            <v-row no-gutters align="center" class="pl-1 py-0">
                <v-col class="pa-0">
                    <v-card-subtitle class="subtitle-1 pa-0">By: ${activityT.conectioner.user.name}</v-card-subtitle>
                </v-col>
            </v-row>
            <v-row no-gutters align="center" >
                <v-card-title class="headline pa-2 mx-auto" >${activityT.name}</v-card-title>
            </v-row>
            <v-row align="center">
                <v-col >
                    <p>${activityT.description}</p>
                    <p>Duration: ${activityT.duration}</p>
                </v-col>
            </v-row>
            <v-row align="center" >
                <v-col>
                    <p class="title ml-3">Address: ${activityT.address}</p>
                </v-col>
            </v-row>
            <v-divider></v-divider>
            <v-row>
                <v-col class="pa-1">
                    <p class="title ml-5 py-1">Availability:</p>
                </v-col>
            </v-row>
            <v-row align="center">
                <v-chip-group
                        v-model="currentChip"
                        active-class="teal accent-2"
                        class="ma-auto"
                >
                    <g:each var="activity" in="${activityT.activity}">
                        <v-chip value="${activity.id}" @click="setCurrentParticipants(${activity.participants})" class="ma-3">${activity.initDate} ${activity.initTime}</v-chip>
                    </g:each>
                </v-chip-group>
            </v-row>
            <g:if test="${session.authorized && session.authorized.user.isTypeConsumer()}">
                <v-row align="center" >
                    <v-col cols="9"></v-col>
                    <v-col cols="1">
                        <v-card-subtitle v-show="currentParticipants != null">{{currentParticipants}}/${activityT.maxParticipants}</v-card-subtitle>
                    </v-col>
                    <v-col>
                        <v-btn rounded color="#59D0B4" v-show="!isSubscribed"  :disabled="currentChip == null || currentParticipants >= ${activityT.maxParticipants}" @click="takeOnActivity(currentChip)">
                            Inscribirse
                        </v-btn>
                        <v-btn rounded color="#59D0B4"  v-show="isSubscribed"  @click="takeOffActivity(currentChip)">
                            Desinscribirse
                        </v-btn>
                    </v-col>
                </v-row>
            </g:if>
        </v-container>
    </v-card-actions>
</v-card>
</div>
