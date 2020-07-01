<%--
  Created by IntelliJ IDEA.
  User: tobias
  Date: 6/6/20
  Time: 17:59
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Search</title>
    <meta name="layout" content="main"/>
</head>
<body>

<g:form controller="search" action="searchResult">
    <v-card color="#1d1e33" shaped width="800" class="ma-auto my-5">
        <v-container >
            <v-row>
                <v-col cols="1"></v-col>
                <v-col class="pa-0" cols="4">
                    <v-text-field dark label="Name of the Activity" name="name" value="${name}"></v-text-field>
                </v-col>
                <v-col cols="2"></v-col>
                <v-col class="pa-0" cols="4">
                    <v-text-field dark label="Name of the Connectioner" name="connectioner" value="${connectioner}"></v-text-field>
                </v-col>
                <v-col cols="1"></v-col>
            </v-row>
            <v-row>
                <v-col cols="1"></v-col>
                <v-col class="pa-0">
                    <v-select
                            dark
                            label="<g:message code="category"/>"
                            name="category"
                            value="${category}"
                            :items="categories"
                            clearable
                    ></v-select>
                </v-col>
                <v-col cols="1"></v-col>
                <v-col class="pa-0">
                    <v-select
                            dark
                            label="<g:message code="country"/>"
                            name="country"
                            value="${country}"
                            :items="countries"
                            @change="getProvinces($event)"
                    ></v-select>
                </v-col>
                <v-col cols="1"></v-col>
                <v-col class="pa-0">
                    <v-select
                            dark
                            label="<g:message code="province"/>"
                            name="province"
                            value="${province}"
                            :items="provinces"
                    ></v-select>
                </v-col>
                <v-col cols="1"></v-col>
            </v-row>
            <v-container class="ma-1 pa-1" fluid >
                <v-row align="center" justify="center">
                    <v-col>
                        <v-btn color="#59D0B4" class="white--text" type="submit" width="200" name="save" value="Buscar">
                            Search
                        </v-btn>
                    </v-col>
                </v-row>
            </v-container>
        </v-container>
    </v-card>
</g:form>

<g:if test="${result != null}">
    <v-container fluid>
            <v-row no-gutters>
                <v-col>
                    <p class="ml-5 headline">Results:</p>
                </v-col>
            </v-row>
    <g:if test="${result.size() > 0}">
            <v-row>
                <v-carousel
                        height="500"
                        hide-delimiters
                        show-arrows-on-hover>
                    <v-carousel-item :key="j" v-for="j in ${((result.size() - 1)/3) + 1}">
                        <v-container fluid>
                            <v-row>
                                <g:each in="${result}" var="activityt" status="i">
                                    <v-col v-if="(j-1) * 3 <= ${i} && ${i} < (j) *3">
                                        <v-card  class="mx-auto"
                                                 max-width="400">
                                            <v-container fluid class="pa-0">
                                                <v-img
                                                        src="https://cdn.vuetifyjs.com/images/cards/house.jpg"
                                                        gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                                                        height="160px"
                                                >
                                                    <v-row no-gutters align="center" class="pl-2 py-0">
                                                        <v-col class="pa-0">
                                                            <v-card-title class="pa-0 subtitle-1 white--text">Categoria: ${activityt.category.name}</v-card-title>
                                                            <v-card-title class="pa-0  white--text"> ${activityt.name}</v-card-title>
                                                        </v-col>
                                                    </v-row>
                                                </v-img>
                                            </v-container>
                                            <v-card-actions class="pa-0">
                                                <v-container fluid class="pa-1">
                                                    <v-row align="center">
                                                        <v-col cols="9" class="pa-1">
                                                            <v-card-title class="white--text ml-3 pa-2"  >By: ${activityt.conectioner.user.name}</v-card-title>
                                                        </v-col>
                                                    </v-row>
                                                    <v-row align="center" class="ma-0 pa-0">
                                                        <v-col class="pa-0" >
                                                            <p class="my-0 mx-1">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus dolore eius facilis inventore laboriosam mollitia officiis porro, qui, quia quod, repellendus tempore temporibus vel! Beatae doloremque id obcaecati porro quas.${activityt.description}</p>
                                                        </v-col>
                                                    </v-row>
                                                    <v-row class="ma-0 pa-0">
                                                        <v-col cols="8"></v-col>
                                                        <v-col class="ma-0">
                                                            <v-btn rounded color="#59D0B4" href="/activityTemplate/details/${activityt.id}">
                                                                more
                                                            </v-btn>
                                                        </v-col>
                                                    </v-row>
                                                </v-container>
                                            </v-card-actions>
                                        </v-card>
                                    </v-col>
                                </g:each>
                            </v-row>
                        </v-container>
                    </v-carousel-item>
                </v-carousel>
            </v-row>
        </v-container>
    </g:if>
    <g:else>
        <v-row>
            <v-col>
                <p class="headline">Ups... There were no results for that search</p>
            </v-col>
        </v-row>
    </g:else>
</g:if>
</v-container>
</body>
</html>