<%--
  Created by IntelliJ IDEA.
  User: faust
  Date: 7/4/2020
  Time: 2:23 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Register</title>
    <meta name="layout" content="main"/>
</head>
<body>
    <v-container>
        <v-row>
            <v-col cols="5">
                <v-card color="#1d1e33" max-width="550" class="ma-auto">
                    <v-container fluid class="pa-0">
                        <v-img
                                src="${assetPath(src: '/stock/consumer.png')}"
                                gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                                height="250px"
                        >
                        </v-img>
                    </v-container>
                    <v-container >
                        <v-row>
                            <v-col class="pa-0">
                                <p class="white--text headline mb-0">Consumer</p>
                            </v-col>
                        </v-row>
                        <v-row>
                            <v-col>
                                <p class="white--text">Do you want to enjoy the best activities available in your zone? Connectify is a service that brings you the opportunity to be part of a wide community of people who choose to invest their spare time doing amazing things, learning new skills and meeting more people like them.</p>
                            </v-col>
                        </v-row>
                        <v-divider dark>
                        </v-divider>
                        <v-row>
                            <v-col class="pb-0">
                                <p class="white--text">Want to be part of our community?</p>
                            </v-col>
                        </v-row>
                        <v-row>
                            <v-col>
                                <v-btn dark color="#59D0B4" href="/consumer/create">Register as a Consumer</v-btn>
                            </v-col>
                        </v-row>
                    </v-container>
                </v-card>
            </v-col>
            <v-col cols="2"></v-col>
            <v-col cols="5">
                <v-card color="#1d1e33" max-width="550" class="ma-auto">
                    <v-container fluid class="pa-0">
                        <v-img
                                src="${assetPath(src: '/stock/connectioner.jpg')}"
                                gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                                height="250px"
                        >
                        </v-img>
                    </v-container>
                    <v-container>
                        <v-row>
                            <v-col class="pa-0">
                                <p class="white--text headline mb-0">Connectioner</p>
                            </v-col>
                        </v-row>
                        <v-row>
                            <v-col>
                                <p class="white--text">Do you want to share your activities with more people? Connectify provides you with a platform to connect our community to your activities obtaining a benefit according to the amount of people that participate on them. Expand your attendant base and make your bussiness more profitable   </p>
                            </v-col>
                        </v-row>
                        <v-divider dark>
                        </v-divider>
                        <v-row>
                            <v-col class="pb-0">
                                <p class="white--text">Want to start working with us?</p>
                            </v-col>
                        </v-row>
                        <v-row>
                            <v-col>
                                <v-btn dark color="#59D0B4" href="/conectioner/create">Register as a Connectioner</v-btn>
                            </v-col>
                        </v-row>
                    </v-container>
                </v-card>
            </v-col>
        </v-row>
    </v-container>

</body>
</html>