<%--
  Created by IntelliJ IDEA.
  User: tobias
  Date: 30/5/20
  Time: 16:00
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Subscribe</title>
    <meta name="layout" content="main"/>
</head>
<body>
<v-container>
    <v-row>
        <v-col class="ml-4" >
            <v-card color="#1d1e33" max-width="350" height="350" class="ma-auto">
                <v-container fluid class="pa-0">
                    <v-img
                            src="${assetPath(src: '/stock/payment1.jpg')}"
                            gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                            height="160px"
                    >
                    </v-img>
                </v-container>
                <v-container>
                    <v-row justify="center">
                        <v-col class="pa-0">
                            <p class="pa-2 mb-0 teal--text text--accent-3 title">Take part in all the activities you want</p>
                        </v-col>
                    </v-row>
                    <v-row>
                        <v-col class="pa-0">
                            <v-card-text class="white--text">
                                By paying our subscription you will have unlimited access to any of the activities of the platform, without restrictions
                            </v-card-text>
                        </v-col>
                    </v-row>
                </v-container>
            </v-card>
        </v-col>
        <v-col >
            <v-card color="#1d1e33" max-width="350" height="350" class="ma-auto">
                <v-container fluid class="pa-0">
                    <v-img
                            src="${assetPath(src: '/stock/payment2.jpg')}"
                            gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                            height="160px"
                    >
                    </v-img>
                </v-container>
                <v-container>
                    <v-row justify="center">
                        <v-col class="pa-0">
                            <p class="pa-2 mb-0 teal--text text--accent-3 title">Direct contact with our <br> Connectioners</p>
                        </v-col>
                    </v-row>
                    <v-row>
                        <v-col class="pa-0">
                            <v-card-text class="white--text">
                                Any questions, complains or problems can be discussed directly with the activity provider
                            </v-card-text>
                        </v-col>
                    </v-row>
                </v-container>
            </v-card>
        </v-col>
        <v-col>
            <v-card color="#1d1e33" max-width="350" height="350" class="ma-auto">
                <v-container fluid class="pa-0">
                    <v-img
                            src="${assetPath(src: '/stock/payment3.jpeg')}"
                            gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                            height="160px"
                    >
                    </v-img>
                </v-container>
                <v-container>
                    <v-row justify="center">
                        <v-col class="pa-0">
                            <p class="pa-2 mb-0 teal--text text--accent-3 title">Best price in the market guaranteed</p>
                        </v-col>
                    </v-row>
                    <v-row>
                        <v-col class="pa-0">
                            <v-card-text class="white--text">
                                The complete control that every Connectioner has over their activities and our business model allow us to provide the best prices in the market
                            </v-card-text>
                        </v-col>
                    </v-row>
                </v-container>
            </v-card>
        </v-col>
    </v-row>
    <v-row>
        <g:each in="${preferencesInfo}" var="preferenceInfo">
            <v-col cols="3" >
                <v-card color="#1d1e33" max-width="300" height="250" class="ma-auto">
                    <v-container fluid class="pa-0" >
                        <v-row no-gutters>
                            <v-col>
                                <g:if test="${preferenceInfo.months != 12}">
                                    <h3 class="white--text text-center pa-3">
                                        ${preferenceInfo.months} month plan
                                    </h3>
                                </g:if>
                                <g:else>
                                    <h3 class="teal--text text--accent-3 pa-3">
                                        ${preferenceInfo.months} month plan
                                    </h3>
                                </g:else>
                            </v-col>
                        </v-row>
                        <v-divider dark></v-divider>
                        <v-row no-gutters>
                            <v-col >
                                <v-card-subtitle class="white--text text-left pa-2">
                                    <v-icon color="#1DE9B6">mdi-minus</v-icon>
                                    One payment of $${preferenceInfo.price}
                                </v-card-subtitle>
                            </v-col>
                        </v-row>
                        <v-row no-gutters>
                            <v-col>
                                <v-card-text class="white--text text-left pa-2">
                                    <v-icon color="#1DE9B6">mdi-minus</v-icon>
                                    Final price per month <strong>$${preferenceInfo.price / preferenceInfo.months as int}</strong>/month
                                </v-card-text>
                            </v-col>
                        </v-row>
                        <v-row no-gutters>
                            <v-col>
                                <g:if test="${preferenceInfo.months > 1}">
                                    <v-card-text class="white--text text-left pa-2">
                                        <v-icon color="#1DE9B6">mdi-minus</v-icon>
                                        Obtain a <strong>%${100 - (preferenceInfo.price / preferenceInfo.months as int)}</strong> discount
                                    </v-card-text>
                                </g:if>
                                <g:else>
                                    <v-card-text class="white--text pa-2">
                                        <span><br></span>
                                    </v-card-text>
                                </g:else>
                            </v-col>
                        </v-row>
                        <v-row no-gutters>
                            <v-col>
                                <g:if test="${preferenceInfo.months == 12}">
                                    <v-card-text class="teal--text text--accent-3">
                                        BEST PRICE
                                    </v-card-text>
                                </g:if>
                                <g:else>
                                    <v-card-text class="white--text">
                                        <span><br></span>
                                    </v-card-text>
                                </g:else>
                            </v-col>
                        </v-row>
                        <v-row no-gutters>
                            <v-col class="pa-0">
                                <v-btn block color="#1DE9B6" bold href="${preferenceInfo.preference.initPoint}">Select this plan</v-btn>
                            </v-col>
                        </v-row>
                    </v-container>
                </v-card>
            </v-col>
        </g:each>
    %{--            <a href="${preferenceInfo.preference.initPoint}">Suscribirse por ${preferenceInfo.months} meses. A solo $${preferenceInfo.price}</a>--}%
    </v-row>
    <v-row justify="center">
        <v-col cols="8">
                <v-card color="#1d1e33"  class="ma-auto">
                    <v-card-title class="text-h5 white--text text-center pa-3">
                        Durante la etapa de prueba del producto, utilizar los siguientes datos para realizar un pago:
                    </v-card-title>
                    <v-card-text>
                        <p class="text-h6 white--text text-center px-3"><v-icon color="#1DE9B6">mdi-minus</v-icon> Numero de tarjeta: 5031 7557 3453 0604</p>
                        <p class="text-h6 white--text text-center px-3"><v-icon color="#1DE9B6">mdi-minus</v-icon>Fecha de vencimiento: 11/25</p>
                        <p class="text-h6 white--text text-center px-3"><v-icon color="#1DE9B6">mdi-minus</v-icon>CVV: 123</p>
                        <p class="text-h6 white--text text-center px-3">Si se quiere probar que pasa si el pago es aprovado o falla utilizar como nombre APRO o FUND correspondientemente. El DNI puede ser cualquier DNI válido</p>
                    </v-card-text>
                </v-card>
        </v-col>
    </v-row>
</v-container>
</body>


