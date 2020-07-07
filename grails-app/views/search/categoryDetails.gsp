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
            <v-card color="#2E3047" height="380">
                <v-row >
                    <v-carousel
                            height="450"
                            hide-delimiters
                            show-arrows-on-hover>

                        <v-carousel-item :key="j" v-for="j in ${(int)((activityTemplates.size() - 1 )/4) + 1} ">
                            <v-container fluid>
                                <v-row>
                                    <g:each var="activityt" in="${activityTemplates}" status="i">
                                        <v-col v-if="(j-1) * 4 <= ${i} && ${i} < (j) *4">
                                            <v-card  class="mx-auto"
                                                     class="mx-auto" max-width="350" height="330">
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
                                                                <v-card-title class="pa-0 subtitle-1 white--text">By: ${activityt.conectioner.user.name}</v-card-title>
                                                                <p style="text-overflow:ellipsis; white-space: nowrap; overflow: hidden;" class="pa-0 teal--text  text--accent-3 text-left headline">${activityt.name}</p>
                                                            </v-col>
                                                        </v-row>
                                                        <v-row align="center" class="ma-0 pa-0">
                                                            <v-col class="pa-0" >
                                                                <p style="text-overflow:ellipsis; white-space: nowrap; overflow: hidden;">${activityt.description}</p>
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
                    <p class="headline">Ups... There are no activities of this category yet, try looking for other categories</p>
                </v-col>
            </v-row>
        </g:else>
    </v-container>
</div>
</body>
</html>