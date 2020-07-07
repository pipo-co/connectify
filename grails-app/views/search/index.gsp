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
                            :value="${category? category : -1}"
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
                            clearable
                            @click:clear="provinces = null"
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
                            :disabled="provinces === null || provinces.length === 0"
                            clearable
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
            <v-card color="#2E3047" height="380">
                <v-row>
                    <v-carousel
                            height="450"
                            hide-delimiters
                            show-arrows-on-hover>
                        <v-carousel-item :key="j" v-for="j in ${(int)((result.size() - 1)/4) + 1}">
                            <v-container fluid>
                                <v-row>
                                    <g:each in="${result}" var="activityt" status="i">
                                        <v-col v-if="(j-1) * 4 <= ${i} && ${i} < (j) *4">
                                            <v-card  class="mx-auto"
                                                     max-width="350" height="330">
                                                <v-container fluid class="pa-0">
                                                    <v-img
                                                            src="${assetPath(src: activityt.category.randStockImgPath())}"
                                                            gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                                                            height="150px"
                                                    >
                                                    </v-img>
                                                </v-container>
                                                <v-card-actions class="pa-0">
                                                    <v-container fluid class="pa-1">
                                                        <v-row no-gutters align="center" class="pl-1 py-0">
                                                            <v-col cols="10" class="pa-0">
                                                                <v-card-title class="pa-0 subtitle-1 white--text">By: ${activityt.conectioner.user.name} - Category: ${activityt.category.name}</v-card-title>
                                                                <p style="text-overflow:ellipsis; white-space: nowrap; overflow: hidden;" class="pa-0 teal--text text--accent-3 text-left headline">${activityt.name}</p>
                                                            </v-col>
                                                        </v-row>
                                                        <v-row align="center" class="ma-0 pa-0">
                                                            <v-col class="pa-0" >
                                                                <p style="text-overflow:ellipsis; white-space: nowrap; overflow: hidden;" >${activityt.description}</p>
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
            </v-card>
        </g:if>
        <g:else>
            <v-row>
                <v-col>
                    <p class="headline">Ups... There were no results for that search</p>
                </v-col>
            </v-row>
        </g:else>
    </v-container>
</g:if>
</v-container>
</body>
</html>