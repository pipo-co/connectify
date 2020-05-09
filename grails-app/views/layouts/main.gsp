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
        <navbar></navbar>
        <div class="navbar mb-5">
            <v-toolbar fixed app color="#2E3047">
                <v-container fluid>
                    <v-row no-gutters align="center">
                        <v-col cols="5">
                            <v-list-item dense>
                                <v-btn class="ma-1 pa-1" href="/" text>
                                    <v-toolbar-title class="headline white--text" >Connectify</v-toolbar-title>
                                </v-btn>
                                <v-btn class="ma-1 pa-1" text>
                                    <v-toolbar-title class="subtitle-1 white--text" >Mapas</v-toolbar-title>
                                </v-btn>
                                <v-btn class="ma-1 pa-1" text>
                                    <v-toolbar-title class="subtitle-1 white--text" >Categorias</v-toolbar-title>
                                </v-btn>
                                <v-btn class="ma-1 pa-1" text>
                                    <v-toolbar-title class="subtitle-1 white--text">Buscar <v-icon>mdi-magnify</v-icon></v-toolbar-title>
                                </v-btn>
                            </v-list-item>
                        </v-col>
                        <v-col cols="4">
                            <v-spacer></v-spacer>
                        </v-col>
                        <v-col cols="3" >
                            <v-list-item dense class="ma-1 pa-1">
                                <v-list-avatar >
                                    <g:if test="${session.authorized && session.authorized.isLoggedIn}">
                                        <img src="${resource(dir: "avatar", file: "/${session.authorized.user.avatar}")}" style="height: 80px; width: 100px" class="card-img-top"/>
                                    </g:if>
                                    <g:else>
                                        <v-btn class="ma-2 pa-2" text>
                                            <v-toolbar-title class="subtitle-1 white--text">Registrarse</v-toolbar-title>
                                        </v-btn>
                                        <v-btn class="ma-2 pa-2" text>
                                            <v-toolbar-title class="subtitle-1 white--text">Iniciar sesion</v-toolbar-title>
                                        </v-btn>
                                    </g:else>
                                </v-list-avatar>
                                <v-btn class="ma-2 pa-2" text>
                                    <v-toolbar-title >
                                        <g:if test="${session.authorized && session.authorized.isloggedin}">
                                        <g:if test="${session.authorized.user.usertype == GlobalConfig.USER_TYPE.CONSUMER.consumer}">
                                            <p style="color: red">welcome ${session.authorized.user.name} ${session.authorized.user.consumer.lastname}</p>
                                        </g:if>
                                        <g:else>
                                            <v-toolbar-title class="subtitle-1 red--text " >Welcome  ${session.authorized.user.name}</v-toolbar-title>
                                        </g:else>
                                    </g:if>
                                        <g:else>
                                            <v-toolbar-title class="subtitle-1 red--text">Welcome</v-toolbar-title>
                                        </g:else>
                                    </v-toolbar-title>
                                </v-btn>
                                    <v-btn class="ma-1 pa-1" text>
                                        <v-icon color="white" large>mdi-calendar </v-icon>
                                    </v-btn>
                                </v-btn>
                            </v-list-item>
                        </v-col>
                    </v-row>
                </v-container>
            </v-toolbar>
        </div>

<g:layoutBody/>

        <v-footer
                color="#2E3047"
                padless
        >
        <v-row
                justify="center"
                no-gutters
        >
            <v-row
                    justify="center"
                    no-gutters
            >
                <v-btn
                        v-for="link in links"
                        :key="link"
                        color="white"
                        text
                        rounded
                        class="my-2"
                >
                    {{ link }}
                </v-btn>
        </v-row>
            <v-card
                    flat
                    tile
                    class="lighten-1 white--text text-center"
                    color="#2E3047"
            >
                <v-card-text>
                    <v-btn
                            v-for="icon in icons"
                            :key="icon"
                            class="mx-4 white--text"
                            icon
                    >
                        <v-icon size="24px">{{ icon }}</v-icon>
                    </v-btn>
                </v-card-text>

                <v-card-text class="white--text pt-0">
                    Somos un equipo de emprendedores que no tienen profesores ya que fueron poseidos por el espiritu italiano de las pastas. Ellos, convertidos en gnocci decidieron nunca mas volver a darnos clases para poder hacerse asi con nuestras ganas de bibir.
                </v-card-text>

                <v-divider></v-divider>

                <v-card-text class="white--text">
                    {{ new Date().getFullYear() }} — <strong>Connectify</strong>
                </v-card-text>
            </v-card>
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