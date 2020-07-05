<!doctype html>
<html lang="en" class="no-js">
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/@mdi/font@4.x/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.min.css" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <asset:stylesheet src="main.css"/>

    <g:layoutHead/>

    <title>
        <g:layoutTitle default="Connectify"/>
    </title>
</head>

<body>

<div id="app">
    <div v-if="!show" class="loader-wrapper">
        <span class="loader"><span class="loader-inner"></span></span>
    </div>
    <v-app v-if="show" id="main-div">
        <v-app-bar elevate-on-scroll fixed app color="#2E3047">
            <v-container fluid class="py-0">
                <v-row no-gutters align="center">
                    <v-col cols="5" >
                        <v-list-item dense>
                            <v-avatar>
                                <asset:image src="logo.png" height="70" alt="Connectify Logo"/>
                            </v-avatar>
                            <v-btn class="ma-1 pa-1" href="/" text>
                                <v-toolbar-title class="headline white--text" >Connectify</v-toolbar-title>
                            </v-btn>
                            <v-btn class="ma-1 pa-1" href="/map/index" text>
                                <v-toolbar-title class="subtitle-1 white--text" >Map</v-toolbar-title>
                            </v-btn>
                            <v-btn class="ma-1 pa-1" text href="/search/categoryList">
                                <v-toolbar-title class="subtitle-1 white--text" >Categories</v-toolbar-title>
                            </v-btn>
                            <v-btn class="ma-1 pa-1" text href="/search/index">
                                <v-toolbar-title class="subtitle-1 white--text">Search <v-icon>mdi-magnify</v-icon></v-toolbar-title>
                            </v-btn>
                        </v-list-item>
                    </v-col>
                    <g:if test="${session.authorized && session.authorized.isLoggedIn && session.authorized.user.isTypeConsumer()}">
                        <v-col cols="5">
                            <v-spacer></v-spacer>
                        </v-col>
                        <v-col cols="2" class="pa-1" >
                            <v-list-item dense class="ma-1 pa-1">
                                <v-list-item-avatar>
                                    <v-img src="${UIHelper.avatarPath(user: session.authorized.user)}" height="60" width="80" class="card-img-top"></v-img>
                                </v-list-item-avatar>
                                <div class="text-center">
                                    <v-menu offset-y>
                                        <template v-slot:activator="{ on }">
                                            <v-btn
                                                    color="#59D0B4"
                                                    v-on="on"
                                                    text
                                            >
                                                ${session.authorized.user.name}
                                                <v-icon small>mdi-chevron-down</v-icon>

                                            </v-btn>
                                        </template>
                                        <v-list>
                                            <v-list-item
                                                    href="/consumer/details/${session.authorized.user.consumer.id}"
                                            >
                                                <v-list-item-title class="black--text">Profile</v-list-item-title>
                                            </v-list-item>
                                            <v-list-item
                                                    v-for="(item, index) in itemsConsumer"
                                                    :key="index"
                                                    @click=""
                                                    :href="item.link"
                                            >
                                                <v-list-item-title :class="item.color">{{ item.title }}</v-list-item-title>
                                            </v-list-item>
                                        </v-list>
                                    </v-menu>
                                </div>
                            </v-list-item>
                        </v-col>
                    </g:if>
                    <g:elseif test="${session.authorized && session.authorized.isLoggedIn && session.authorized.user.isTypeConnectioner()}">
                        <v-col cols="5">
                            <v-spacer></v-spacer>
                        </v-col>
                        <v-col cols="2" class="pa-1" >
                            <v-list-item dense class="ma-1 pa-1">
                                <v-list-item-avatar>
                                    <v-img src="${UIHelper.avatarPath(user: session.authorized.user)}" height="60" width="80" class="card-img-top"></v-img>
                                </v-list-item-avatar>
                                <div class="text-center">
                                    <v-menu offset-y>
                                        <template v-slot:activator="{ on }">
                                            <v-btn
                                                    color="#59D0B4"
                                                    v-on="on"
                                                    text
                                            >
                                                ${session.authorized.user.name}
                                                <v-icon small>mdi-chevron-down</v-icon>
                                            </v-btn>
                                        </template>
                                        <v-list>
                                            <v-list-item
                                                    href="/conectioner/details/${session.authorized.user.conectioner.id}"
                                            ><v-list-item-title class="black--text">Profile</v-list-item-title>
                                            </v-list-item>
                                            <v-list-item
                                                    v-for="(item, index) in itemsConnectioner"
                                                    :key="index"
                                                    @click=""
                                                    :href="item.link"
                                            >
                                                <v-list-item-title :class="item.color">{{ item.title }}</v-list-item-title>
                                            </v-list-item>
                                        </v-list>
                                    </v-menu>
                                </div>
                            </v-list-item>
                        </v-col>
                    </g:elseif>
                    <g:else>
                        <v-col cols="4" >
                            <v-spacer></v-spacer>
                        </v-col>
                        <v-col>
                            <v-list-item dense class="ma-1 pa-1">
                                <v-btn class="ma-2 pa-2" outlined rounded color="#59D0B4" href="/authentication/login" right>
                                    <v-toolbar-title class="title white--text">Log in</v-toolbar-title>
                                </v-btn>
                                <v-btn class="ma-2 pa-2"   color="#59D0B4" href="/index/register" right>
                                    <v-toolbar-title class="title white--text">Register</v-toolbar-title>
                                </v-btn>
                            </v-list-item>
                        </v-col>
                    </g:else>
                </v-row>
            </v-container>
        </v-app-bar>


        <v-main>
            <g:layoutBody/>
        </v-main>


        <v-footer color="#2E3047" padless>
            <v-container fluid class="pa-1">
                <v-row align="center" justify="center">
                    <v-btn
                            v-for="(link,index) in links"
                            :key="index"
                            color="white"
                            text
                            rounded
                            class="my-2"
                            :href="link.dir">
                        {{ link.name }}
                    </v-btn>
                </v-row>
                <v-row align="center" justify="center">
                    <v-btn
                            v-for="(icon,index) in icons"
                            :key="index"
                            class="mx-4 white--text"
                            icon>
                        <v-icon size="24px">{{ icon }}</v-icon>
                    </v-btn>
                </v-row>
                <v-row justify="center">
                    <v-col class="pb-1">
                        <p class=" white--text">{{ new Date().getFullYear() }} — <strong>Connectify</strong></p>
                    </v-col>
                </v-row>
            </v-container>
        </v-footer>
    </v-app>
</div>

%{--<asset:javascript src="application.js"/>--}%
<script src="https://cdn.jsdelivr.net/npm/vue@2.x/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

%{-- Vue Object --}%
<g:render template="vueObject" contextPath="/layouts"/>

</body>
</html>
