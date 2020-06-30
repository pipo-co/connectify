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
                    <v-list-item-avatar height="150" width="150">
                        <v-img src="${resource(dir: "avatar", file: "/${session.authorized.user.avatar}")}"  class="card-img-top"></v-img>
                    </v-list-item-avatar>
                </v-col>
                <v-col>
                    <v-btn class="ml-2 my-3" rounded  color="#59D0B4">
                    Edit <g:message code="avatar"/>
                </v-btn>
                </v-col>
            </v-row>
        </v-col>
        <v-col>
                <v-container >
                    <v-card shaped="true">
                        <v-row>
                            <v-col>
                                <v-list-item>
                                    <v-list-item-title class="headline"><g:message code="consumer" args="['Details']"/>:</v-list-item-title>
                                </v-list-item>
                            </v-col>
                        </v-row>
                        <v-row>
                            <v-col cols="3">
                                <v-list-item>
                                    <v-list-item-title ><g:message code="username"/>:  </v-list-item-title>
                                </v-list-item>
                            </v-col>
                            <v-col >
                                <v-list-item>
                                    <v-list-item-title class="mx-5">${consumer.user.username}</v-list-item-title>
                                </v-list-item>
                                <v-divider></v-divider>
                            </v-col>

                        </v-row>
                        <v-row>
                            <v-col cols="3">
                                <v-list-item>
                                    <v-list-item-title ><g:message code="name"/>:  </v-list-item-title>
                                </v-list-item>
                            </v-col>
                            <v-col >
                                <v-list-item>
                                    <v-list-item-title class="mx-5">${consumer.user.name}</v-list-item-title>
                                </v-list-item>
                                <v-divider></v-divider>
                            </v-col>

                        </v-row>
                        <v-row>
                            <v-col cols="3">
                                <v-list-item>
                                    <v-list-item-title ><g:message code="last.name"/>:  </v-list-item-title>
                                </v-list-item>
                            </v-col>
                            <v-col >
                                <v-list-item>
                                    <v-list-item-title class="mx-5">${consumer.lastName}</v-list-item-title>
                                </v-list-item>
                                <v-divider></v-divider>
                            </v-col>

                        </v-row>
                        <v-row>
                            <v-col cols="3">
                                <v-list-item>
                                    <v-list-item-title ><g:message code="email"/>:  </v-list-item-title>
                                </v-list-item>
                            </v-col>
                            <v-col >
                                <v-list-item>
                                    <v-list-item-title class="mx-5">${consumer.user.email}</v-list-item-title>
                                </v-list-item>
                                <v-divider></v-divider>
                            </v-col>

                        </v-row>
                        <v-row>
                            <v-col cols="1"><v-spacer></v-spacer></v-col>
                            <v-col>
                                <v-btn rounded class="ml-4"  color="#59D0B4" href="/consumer/edit/${session.authorized.user.consumer.id}">
                                    Edit Profile
                                </v-btn>
                            </v-col>
                        </v-row>
                    </v-card>
                </v-container>
        </v-col>
    </v-row>
</v-container>
