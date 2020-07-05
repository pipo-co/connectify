<%--
  Created by IntelliJ IDEA.
  User: faust
  Date: 6/30/2020
  Time: 5:29 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Categories</title>
    <meta name="layout" content="main"/>
</head>
<body>
<div>
    <v-container fluid>
        <v-row>
            <v-col>
                <p class="headline">Category: ${category.name}</p>
            </v-col>
        </v-row>
        <g:if test="${activityTemplates.size() != 0}">
        <v-row >
            <v-carousel
                    height="450"
                    hide-delimiters
                    show-arrows-on-hover>

                <v-carousel-item :key="j" v-for="j in ${(int)((activityTemplates.size() - 1 )/3) + 1} ">
                    <v-container fluid>
                        <v-row>
                            <g:each var="activityt" in="${activityTemplates}" status="i">
                                <v-col v-if="(j-1) * 3 <= ${i} && ${i} < (j) *3">
                                    <v-card  class="mx-auto"
                                                max-width="400">
                                        <v-container fluid class="pa-0">
                                            <v-img
                                                    src="${assetPath(src: activityt.category.randStockImgPath())}"
                                                    gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                                                    height="160px"
                                            >
                                                <v-row no-gutters align="center" class="pl-2 py-0">
                                                    <v-col cols="10" class="pa-0">
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
                                                        <v-card-title class="white--text ml-3 pa-2">By: ${activityt.conectioner.user.name}</v-card-title>
                                                    </v-col>
                                                </v-row>
                                                <v-row align="center" class="ma-0 pa-0">
                                                    <v-col class="pa-0" >
                                                        <p class="my-0 mx-1">${activityt.description}</p>
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
        </g:if>
        <g:else>
            <v-row>
                <v-col>
                    <p class="headline">Ups... There are no activities of this category yet, try looking for other categories</p>
                </v-col>
            </v-row>
        </g:else>
    </v-container>
</div>
</body>
</html>