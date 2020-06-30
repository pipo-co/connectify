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
                    <p class="headline">Category: </p>
                </v-col>
            </v-row>
            <v-row>
                <g:each var="category" in="${categoryList}">
                    <v-col cols="2">
                        <v-card href="/search/categoryDetails/${category.id}">
                        <v-container>
                            <v-row>
                                <v-col>
                                <v-avatar color="#59D0B4" size="80">
                                    <v-img src="${resource(dir: "category", file: "/${category.indexImgPath()}")}" height="52" width="52" contain></v-img>
                                </v-avatar>
                            </v-col>
                            </v-row>
                            <v-row>
                                <v-col>
                                    <p class="title">${category.name}</p>
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