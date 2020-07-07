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
            %{--<template>
                <v-data-table
                        :headers="headers"
                        items="${activityList}"
                        :items-per-page="5"
                        item-key="info"
                        class="elevation-1"
                        :footer-props="{
                          showFirstLastPage: true,
                          firstIcon: 'mdi-arrow-collapse-left',
                          lastIcon: 'mdi-arrow-collapse-right',
                          prevIcon: 'mdi-minus',
                          nextIcon: 'mdi-plus'
                        }"
                ></v-data-table>
            </template>--}%
        </v-col>
    </v-row>
</v-container>
%{--<g:each in="${activityList}" var="info">
    <v-col>
        <v-card color="#1d1e33" class="mx-auto" max-width="400">
            <v-container fluid class="pa-0">
                <v-img
                        src="https://cdn.vuetifyjs.com/images/cards/house.jpg"
                        gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                        height="160px"
                >
                    <v-row no-gutters align="center" class="pl-1 py-0">
                        <v-col cols="10" class="pa-0">
                            <v-card-title class="subtitle-1 pa-0 white--text">Category: ${info.activityTemplate.category.name}</v-card-title>
                            <v-card-title class="pa-0  white--text"> ${info.activityTemplate.name}</v-card-title>
                        </v-col>
                    </v-row>
                </v-img>
            </v-container>
            <v-card-actions class="pa-0">
                <v-container fluid class="pa-1">
                    <v-row no-gutters align="start" justify="start">
                        <v-col cols="9" class="pa-1">
                            <v-card-title class="teal--text text--accent-3 ml-3 pa-2"  >By:${info.activityTemplate.conectioner.user.username}</v-card-title>
                        </v-col>
                    </v-row>
                    <v-row no-gutters align="start" justify="start">
                        <v-col class="px-2">
                            <v-card-title class="white--text">${info.activityTemplate.description}</v-card-title>
                        </v-col>
                    </v-row>
                    <v-row no-gutters align="center">
                        <v-col class="px-2" >
                            <v-card-title class="white--text subtitle-1 py-0">Address: ${info.activityTemplate.address}</v-card-title>
                        </v-col>
                    </v-row>
                    <v-divider dark></v-divider>
                    <v-row no-gutters align="center">
                        <v-col class="pa-0" >
                            <p class="white--text headline ml-5 my-0">Availability:</p>
                        </v-col>
                    </v-row>
                    <v-row no-gutters align="center">
                        <v-col class="pa-0">
                            <p class="ml-5 my-0 white--text text-center">Participants:${info.participants}/${info.activityTemplate.maxParticipants}</p>
                        </v-col>
                    </v-row>
                    <v-row no-gutters align="center">
                        <v-col class="pa-0" >
                            <p class="ml-5 my-0 white--text text-center">Starts:${info.initDate} at ${info.initTime}</p>
                        </v-col>
                    </v-row>
                    <v-row class="pa-0 ma-0">
                        <v-col class="pa-0 ma-0">
                            <v-list color="#1d1e33">
                                <v-list-item>
                                    <v-btn color="#59D0B4" class="mx-auto" href="${createLink(controller: 'activity', action: 'details', id: info.id)}">
                                        Detail
                                    </v-btn>
                                    --}%%{--<v-btn color="#59D0B4" class="mx-auto" href="${createLink(controller: 'activityTemplate', action: 'edit', id: info.id)}">
                                        Edit
                                    </v-btn>--}%%{--
                                    <v-btn color="red" class="mx-auto" href="${createLink(controller: 'activity', action: 'delete', id: info.id)}">
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
</v-container>--}%


