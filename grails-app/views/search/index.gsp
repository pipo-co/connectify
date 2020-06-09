<%--
  Created by IntelliJ IDEA.
  User: tobias
  Date: 6/6/20
  Time: 17:59
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Buscar</title>
    <meta name="layout" content="main"/>
</head>

<body>
<v-row>
    <v-col cols="9">
        <p class="headline">Busca actividades!!</p>
    </v-col>
</v-row>

<g:form controller="search" action="searchResult">
    <v-card width="800" class="ma-auto">
<v-container >
%{-- Name   --}%
    <v-row >
        <v-col class="pa-0">
            <v-text-field
                    label="Nombre de la actividad"
                    name="name"
                    value="${name}"
            >
            </v-text-field>
        </v-col>
    </v-row>
    <v-row >
        <v-col class="pa-0">
            <v-text-field
                    label="Nombre del Connectioner"
                    name="connectioner"
                    value="${connectioner}"
            >
            </v-text-field>
        </v-col>
    </v-row>
%{-- Category   --}%
    <v-row>
        <v-col class="pa-0">
            <v-select
                    label="<g:message code="category"/>"
                    name="category"
                    value="${category}"
                    :items="categories"
                    clearable
            ></v-select>
        </v-col>
    </v-row>
%{-- Location --}%
    <v-row>
        <v-col class="pa-0">
            <v-select
                    label="<g:message code="country"/>"
                    name="country"
                    value="${country}"
                    :items="countries"
                    @change="getProvinces($event)"
            ></v-select>
        </v-col>
    </v-row>
    <v-row>
        <v-col class="pa-0">
            <v-select
                    label="<g:message code="province"/>"
                    name="province"
                    value="${province}"
                    :items="provinces"
            ></v-select>
        </v-col>
    </v-row>
    <v-container class="ma-1 pa-1" fluid>
        <v-row align="center" justify="center" >
            <v-col cols="2">
                <v-btn color="#59D0B4" class="white--text" type="submit" width="200" name="save" value="Buscar">
                    Register
                </v-btn>
            </v-col>
        </v-row>
    </v-container>
    </v-container>
    </v-card>
</g:form>

<g:if test="${result}">
    <g:each in="${result}" var="activityT">
        <p>${activityT.name}</p>
    </g:each>
</g:if>
</body>
</html>