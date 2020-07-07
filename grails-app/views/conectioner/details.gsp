<%--
  Created by IntelliJ IDEA.
  User: tobias
  Date: 1/5/20
  Time: 00:46
--%>

%{--Include Main Layout--}%
<meta name="layout" content="main"/>
<v-container fluid>
    <v-row>
        <v-col cols="1">
            <v-row no-gutters>
                <v-col >
                    <v-list-item-avatar height="200" width="200">
                        <v-img src="${UIHelper.avatarPath(user: session.authorized.user)}"  class="card-img-top"></v-img>
                    </v-list-item-avatar>
                </v-col>
            </v-row>
        </v-col>
        <v-col>
            <v-container >
                <v-card shaped color="#1d1e33" max-width="1200">
                    <v-row>
                        <v-col>
                            <v-list-item>
                                <v-list-item-title class="white--text headline"><g:message code="conectioner" args="['Details']"/>:</v-list-item-title>
                            </v-list-item>
                        </v-col>
                    </v-row>
                    <v-row>
                        <v-col cols="3">
                            <v-list-item>
                                <v-list-item-title class="white--text"><g:message code="username"/>:  </v-list-item-title>
                            </v-list-item>
                        </v-col>
                        <v-col >
                            <v-list-item>
                                <v-list-item-title class="white--text mx-5">${conectioner.user.username}</v-list-item-title>
                            </v-list-item>
                            <v-divider dark></v-divider>
                        </v-col>
                    </v-row>
                    <v-row>
                        <v-col cols="3">
                            <v-list-item>
                                <v-list-item-title class="white--text"><g:message code="name"/>:  </v-list-item-title>
                            </v-list-item>
                        </v-col>
                        <v-col >
                            <v-list-item>
                                <v-list-item-title class="white--text mx-5">${conectioner.user.name}</v-list-item-title>
                            </v-list-item>
                            <v-divider dark></v-divider>
                        </v-col>
                    </v-row>
                    <v-row>
                        <v-col cols="3">
                            <v-list-item>
                                <v-list-item-title class="white--text"><g:message code="cbu"/>:  </v-list-item-title>
                            </v-list-item>
                        </v-col>
                        <v-col >
                            <v-list-item>
                                <v-list-item-title class="white--text mx-5">${conectioner.cbu}</v-list-item-title>
                            </v-list-item>
                            <v-divider dark></v-divider>
                        </v-col>

                    </v-row>
                    <v-row>
                        <v-col cols="3">
                            <v-list-item>
                                <v-list-item-title class="white--text"><g:message code="email"/>:  </v-list-item-title>
                            </v-list-item>
                        </v-col>
                        <v-col >
                            <v-list-item>
                                <v-list-item-title class="white--text mx-5">${conectioner.user.email}</v-list-item-title>
                            </v-list-item>
                            <v-divider dark></v-divider>
                        </v-col>

                    </v-row>
                    <v-row>
                        <v-col cols="1"><v-spacer></v-spacer></v-col>
                        <v-col>
                            <v-btn rounded class="ml-4"  color="#59D0B4" href="/conectioner/edit/${session.authorized.user.conectioner.id}">
                                Edit Profile
                            </v-btn>
                        </v-col>
                    </v-row>
                </v-card>
            </v-container>
        </v-col>
    </v-row>
</v-container>