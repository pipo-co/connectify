<%@ page import="java.time.LocalDate" %>
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
                        <v-img src="${UIHelper.avatarPath(user: session.authorized.user)}" class="card-img-top"></v-img>
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
                                <v-list-item-title class="headline white--text"><g:message code="consumer" args="['Details']"/>:</v-list-item-title>
                            </v-list-item>
                        </v-col>
                    </v-row>
                    <v-row>
                        <v-col cols="3">
                            <v-list-item>
                                <v-list-item-title class="white--text"><g:message code="username"/>:</v-list-item-title>
                            </v-list-item>
                        </v-col>
                        <v-col >
                            <v-list-item>
                                <v-list-item-title class="mx-5 white--text">${consumer.user.username}</v-list-item-title>
                            </v-list-item>
                            <v-divider></v-divider>
                        </v-col>
                    </v-row>

                    <v-row>
                        <v-col cols="3">
                            <v-list-item>
                                <v-list-item-title class="white--text" ><g:message code="name"/>:  </v-list-item-title>
                            </v-list-item>
                        </v-col>
                        <v-col >
                            <v-list-item>
                                <v-list-item-title class="white--text mx-5">${consumer.user.name}</v-list-item-title>
                            </v-list-item>
                            <v-divider></v-divider>
                        </v-col>

                    </v-row>
                    <v-row>
                        <v-col cols="3">
                            <v-list-item>
                                <v-list-item-title class="white--text"><g:message code="last.name"/>:  </v-list-item-title>
                            </v-list-item>
                        </v-col>
                        <v-col >
                            <v-list-item>
                                <v-list-item-title class="white--text mx-5">${consumer.lastName}</v-list-item-title>
                            </v-list-item>
                            <v-divider></v-divider>
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
                                <v-list-item-title class="white--text mx-5">${consumer.user.email}</v-list-item-title>
                            </v-list-item>
                            <v-divider></v-divider>
                        </v-col>
                    </v-row>
                    <v-row>
                        <v-col cols="3">
                            <v-list-item>
                                <v-list-item-title class="white--text"><g:message code="suscription"/>:  </v-list-item-title>
                            </v-list-item>
                        </v-col>
                        <v-col >
                            <g:if test="${!consumer.isSuscribed()}">
                                <v-list-item-title class="white--text">There is no current subscription.
                                    <v-btn rounded class="ml-4"  color="#59D0B4" href="${createLink(controller: 'payment', action: 'index')}">
                                        Pay
                                    </v-btn>
                                </v-list-item-title>
                            </g:if>
                            <g:else>
                                <v-list-item-title class="white--text">${consumer.suscribedUntil}</v-list-item-title>
                            </g:else>
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
