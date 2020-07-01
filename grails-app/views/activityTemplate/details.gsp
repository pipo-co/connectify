<meta name="layout" content="main"/>
<v-container>
    <v-row align="center" justify="center">
        <v-col cols="12">
            <v-card  class="mx-auto my-5"
                     width="600" color="#1d1e33">
                <v-container fluid class="pa-0">
                    <v-img
                            src="https://cdn.vuetifyjs.com/images/cards/house.jpg"
                            gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                            height="160px"
                    ></v-img>
                </v-container>
                <v-card-actions class="pa-0">
                    <v-container fluid class="pa-1">
                        <v-row no-gutters justify="start" class="px-4 py-0">
                            <v-col class="pa-0">
                                <v-card-title class="subtitle-1 pa-0 teal--text text--accent-3">By: ${activityT.conectioner.user.name}</v-card-title>
                            </v-col>
                        </v-row>
                        <v-row no-gutters justify="start" >
                            <v-col>
                                <v-card-title class="headline px-4 py-2 white--text" >${activityT.name}</v-card-title>
                            </v-col>
                        </v-row>
                        <v-row no-gutters justify="start">
                            <v-col class="pa-0">
                                <p class="text-left white--text px-4">${activityT.description}</p>
                                <p class="text-left white--text px-4">Duration: ${activityT.duration}</p>
                            </v-col>
                        </v-row>
                        <v-row no-gutters justify="start" >
                            <v-col class="pa-0">
                                <p class="text-left title ml-3 my-0 white--text">Address: ${activityT.address}</p>
                            </v-col>
                        </v-row>
                        <v-divider dark></v-divider>
                        <v-row>
                            <v-col class="pa-1">
                                <p class="title ml-5 py-1 white--text">Availability:</p>
                            </v-col>
                        </v-row>
                        <g:if test="${session.authorized && session.authorized.user.isTypeConsumer()}">
                            <v-row align="center">
                                <v-chip-group
                                        active-class="teal accent-2"
                                        class="ma-auto"
                                >
                                    <g:each var="activity" in="${activityT.activity}">
                                        <v-chip @click="setCurrentParticipants(${activity.isConsumerSigned(session.authorized.user.consumer.id)? activity.participants - 1 : activity.participants}, ${activity.id})" class="ma-3">${activity.initDate} ${activity.initTime}</v-chip>
                                    </g:each>
                                </v-chip-group>
                            </v-row>
                            <v-row no-gutters align="center" justify="end">
                                <v-col cols="2" class="px-0">
                                    <v-card-subtitle class="white--text" v-show="currentParticipants != null"> {{currentParticipants + isSubscribed}}/${activityT.maxParticipants}</v-card-subtitle>
                                </v-col>
                                <v-col cols="3" class="px-0">
                                    <v-btn rounded color="#59D0B4" v-show="!isSubscribed"  :disabled="currentChip == null || currentParticipants >= ${activityT.maxParticipants}" @click="takeOnActivity(currentChip)">
                                        Subscribe
                                    </v-btn>
                                    <v-btn rounded color="#59D0B4"  v-show="isSubscribed"  @click="takeOffActivity(currentChip)">
                                        Unsubscribe
                                    </v-btn>
                                </v-col>
                            </v-row>
                        </g:if>
                    </v-container>
                </v-card-actions>
            </v-card>
        </v-col>
    </v-row>
</v-container>
