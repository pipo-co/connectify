<%--
  Created by IntelliJ IDEA.
  User: faust
  Date: 6/30/2020
  Time: 4:47 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Categories</title>
    <meta name="layout" content="main"/>
</head>
<body>
<div>
    <v-container>
        <v-row>
            <v-col>
                <p class="headline">Categories:</p>
            </v-col>
        </v-row>
        <v-row>
            <g:each var="category" in="${categoryList}">
                <v-col cols="2">
                    <v-card color="#1d1e33" href="/search/categoryDetails/${category.id}" height="200">
                        <v-container>
                            <v-row>
                                <v-col>
                                    <v-avatar size="120">
                                        <v-img src="${assetPath(src: category.indexImgPath())}" height="82" width="82" contain></v-img>
                                    </v-avatar>
                                </v-col>
                            </v-row>
                            <v-row>
                                <v-col class="pa-0">
                                    <p class="white--text title">${category.name}</p>
                                </v-col>
                            </v-row>
                        </v-container>
                    </v-card>
                </v-col>
            </g:each>
        </v-row>
    </v-container>
</div>

</body>
</html>