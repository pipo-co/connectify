<%@ page import="connectify.grailsproject.GlobalConfig" %>
<!doctype html>
<html lang="en" class="no-js">
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/@mdi/font@4.x/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.min.css" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>

<body>

<div id="app">
    <v-app>
        <div class="navbar mb-5">
            <v-toolbar fixed app color="#2E3047">
                <v-container fluid>
                    <v-row no-gutters align="center">
                        <v-col cols="5" >
                            <v-list-item dense>
                                <v-btn class="ma-1 pa-1" href="/" text>
                                    <v-toolbar-title class="headline white--text" >Connectify</v-toolbar-title>
                                </v-btn>
                                <v-btn class="ma-1 pa-1" text>
                                    <v-toolbar-title class="subtitle-1 white--text" >Map</v-toolbar-title>
                                </v-btn>
                                <v-btn class="ma-1 pa-1" text>
                                    <v-toolbar-title class="subtitle-1 white--text" >Categories</v-toolbar-title>
                                </v-btn>
                                <v-btn class="ma-1 pa-1" text>
                                    <v-toolbar-title class="subtitle-1 white--text">Search <v-icon>mdi-magnify</v-icon></v-toolbar-title>
                                </v-btn>
                            </v-list-item>
                        </v-col>
                        <g:if test="${session.authorized && session.authorized.isLoggedIn}">
                            <v-col cols="4">
                                <v-spacer></v-spacer>
                            </v-col>
                             <v-col cols="3" class="pa-1" >
                                 <v-list-item dense class="ma-1 pa-1">
                             <v-list-item-avatar>
                                 <v-img src="${resource(dir: "avatar", file: "/${session.authorized.user.avatar}")}" height="60" width="80" class="card-img-top"></v-img>
                             </v-list-item-avatar>
                             <div class="text-center">
                                 <v-menu offset-y>
                                     <template v-slot:activator="{ on }">
                                         <v-btn
                                                 color="#59D0B4"
                                                 dark
                                                 v-on="on"
                                                 text
                                         >
                                             ${session.authorized.user.name}
                                             <v-icon small>mdi-chevron-down</v-icon>

                                         </v-btn>
                                     </template>
                                     <v-list>
                                         <v-list-item
                                                 v-for="(item, index) in items"
                                                 :key="index"
                                                 @click=""
                                                 :href="item.link"
                                         >
                                             <v-list-item-title :class="item.color">{{ item.title }}</v-list-item-title>
                                         </v-list-item>
                                     </v-list>
                                 </v-menu>
                             </div>
                             %{--<v-btn class="ma-2 pa-2" text >

                                <p class="white--text"> </p>
                             </v-btn>--}%
                             <v-btn class="ma-1 pa-1" text>
                                 <v-icon color="white" large>mdi-calendar</v-icon>
                             </v-btn>
                             </v-list-item>
                             </v-col>
                        </g:if>
                         <g:else>
                             <v-col cols="4" >
                                 <v-spacer></v-spacer>
                             </v-col>
                             <v-col>
                                 <v-list-item dense class="ma-1 pa-1">
                                     <v-btn class="ma-2 pa-2" outlined rounded color="#59D0B4" href="/authentication/login" right>
                                         <v-toolbar-title class="title white--text">Sign in</v-toolbar-title>
                                     </v-btn>
                                     <v-btn class="ma-2 pa-2"   color="#59D0B4" href="/consumer/create" right>
                                         <v-toolbar-title class="title white--text">Register</v-toolbar-title>
                                     </v-btn>
                                 </v-list-item>
                             </v-col>
                         </g:else>
                    </v-row>
                </v-container>
            </v-toolbar>
        </div>

<g:layoutBody/>

        <v-footer color="#2E3047" padless>
        <v-row justify="center" no-gutters>
            <v-row justify="center" no-gutters>
                <v-btn
                        v-for="link in links"
                        :key="link"
                        color="white"
                        text
                        rounded
                        class="my-2">
                    {{ link }}
                </v-btn>
            </v-row>
            <v-card
                    flat
                    tile
                    class="lighten-1 white--text text-center"
                    color="#2E3047">
                <v-card-text>
                    <v-btn
                            v-for="icon in icons"
                            :key="icon"
                            class="mx-4 white--text"
                            icon>
                        <v-icon size="24px">{{ icon }}</v-icon>
                    </v-btn>
                </v-card-text>

                <v-card-text class="white--text pt-0">
                   Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam eum, hic labore laborum molestias perferendis placeat reprehenderit sunt voluptates. Deleniti eum magnam mollitia numquam officia possimus repellendus rerum sequi tempore.
                </v-card-text>

                <v-divider></v-divider>

                <v-card-text class="white--text">
                    {{ new Date().getFullYear() }} — <strong>Connectify</strong>
                </v-card-text>
            </v-card>
        </v-row>
        </v-footer>


<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

<asset:javascript src="application.js"/>

    </v-app>
</div>
<script src="https://cdn.jsdelivr.net/npm/vue@2.x/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.js"></script>

<script>

    new Vue({
        el: '#app',
        vuetify: new Vuetify(),
        data: {
            routines: [
                { name: "Modo Dormir", desc: "Apaga las luces y baja las persianas"},
                { name: "Modo Cine", desc: "Baja las luces y prende el equipo de musica"},
                { name: "Regar Frente", desc: "Prende aspersores del frente del hogar"},
                { name: "Refrescar living", desc: "Bajar persianas living y prender el aire en 24"},
            ],
            icons: [
                'mdi-facebook',
                'mdi-twitter',
                'mdi-linkedin',
                'mdi-instagram',
            ],
            links: [
                'Home',
                'About Us',
                'Team',
                'Services',
                'Blog',
                'Contact Us',
            ],
            items: [
                { title:' Perfil', color:'black--text', link:'/consumer/edit'},
                { title: 'Historial', color:'black--text', link:'#'},
                { title: 'Cerrar sesion', color:'red--text', link:'/authentication/logout'}
            ],
            show: false,
            cards: [
                { category:'Fitness', title: 'Crossfit', show: false, max: '10', suscribed:'7',hour:"17:30", connectioner: 'Big', src: 'https://cdn.vuetifyjs.com/images/cards/house.jpg', flex: 12 },
                { category:'Fitness', title: 'Crossfit2', show: false, max: '10', suscribed:'7',hour:"17:30", connectioner: 'Big', src: 'https://cdn.vuetifyjs.com/images/cards/house.jpg', flex: 12 },
                { category:'Fitness', title: 'Crossfit3', show: false, max: '10', suscribed:'7',hour:"17:30", connectioner: 'Big', src: 'https://cdn.vuetifyjs.com/images/cards/house.jpg', flex: 12 }

            ],
            countries:[
                'Argentina', 'Chile','Brasil'
            ],
            provinces: [
                'Neuquen', 'Jujuy', 'La Pampa'
            ],
            phoneTypes: [
                'cell', 'house'
            ],
            docTypes:[
                'DNI', 'CI', 'Passport'
            ],
            categories: [
                { value: 1, text: 'Fitness'},
                { value: 2, text: 'Cooking'}
            ],
            picker: null,
            timePicker: null,
        },

    })

</script>

</body>
</html>
<script>
    import VCol from "vuetify/src/components/VGrid/VCol";
    export default {
        components: {VCol}
    }
</script>