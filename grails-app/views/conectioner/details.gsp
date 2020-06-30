<%--
  Created by IntelliJ IDEA.
  User: tobias
  Date: 1/5/20
  Time: 00:46
--%>

%{--Include Main Layout--}%
<meta name="layout" content="main"/>

%{--<div class="card">--}%
%{--    <div class="card-header">--}%
%{--        <g:message code="conectioner" args="['Details']"/>--}%
%{--    </div>--}%
%{--    <div class="card-body">--}%
%{--        <g:if test="${conectioner}">--}%
%{--            <table class="table">--}%
%{--                <tr>--}%
%{--                    <th class="text-right"><g:message code="username"/></th><td class="text-left">${conectioner.user.username}</td>--}%
%{--                </tr>--}%
%{--                <tr>--}%
%{--                    <th class="text-right"><g:message code="name"/></th><td class="text-left">${conectioner.user.name}</td>--}%
%{--                </tr>--}%
%{--                <tr>--}%
%{--                    <th class="text-right"><g:message code="email"/></th><td class="text-left">${conectioner.user.email}</td>--}%
%{--                </tr>--}%
%{--                <tr>--}%
%{--                    <th class="text-right"><g:message code="password"/></th><td class="text-left">${conectioner.user.password}</td>--}%
%{--                </tr>--}%
%{--                <tr>--}%
%{--                    <th class="text-right"><g:message code="cbu"/></th><td class="text-left">${conectioner.cbu}</td>--}%
%{--                </tr>--}%
%{--                <tr>--}%
%{--                    <th class="text-right"><g:message code="member.type"/></th><td class="text-left">${member.memberType}</td>--}%
%{--                </tr>--}%
%{--            </table>--}%
%{--            <table class="table">--}%
%{--                <g:each in="${propertiesList}" var="prop">--}%
%{--                    <tr id="${prop.key}">--}%
%{--                        <th class="text-right"><g:message code="${prop.key}"/></th>--}%
%{--                        <td class="text-left">${prop.value}</td>--}%
%{--                    </tr>--}%
%{--                </g:each>--}%
%{--            </table>--}%
%{--        </g:if>--}%
%{--        <div class="form-action-panel">--}%
%{--            <g:link controller="conectioner" action="index" class="btn btn-primary"><g:message code="cancel"/></g:link>--}%
%{--        </div>--}%
%{--    </div>--}%
%{--</div>--}%

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
                                <v-list-item-title class="headline"><g:message code="conectioner" args="['Details']"/>:</v-list-item-title>
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
                                <v-list-item-title class="mx-5">${conectioner.user.username}</v-list-item-title>
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
                                <v-list-item-title class="mx-5">${conectioner.user.name}</v-list-item-title>
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
                                <v-list-item-title class="mx-5">${conectioner.user.email}</v-list-item-title>
                            </v-list-item>
                            <v-divider></v-divider>
                        </v-col>

                    </v-row>
                    <v-row>
                        <v-col cols="1"><v-spacer></v-spacer></v-col>
                        <v-col>
                            <v-btn rounded class="ml-4"  color="#59D0B4" href="/conectioner/edit/${conectioner.id}">
                                Edit Profile
                            </v-btn>
                        </v-col>
                    </v-row>
                </v-card>
            </v-container>
        </v-col>
    </v-row>
</v-container>
