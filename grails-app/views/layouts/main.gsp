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
            <v-toolbar fixed app color="#65C2AD">
                <v-container fluid>
                    <v-row no-gutters>
                        <v-col md="5">
                            <v-list-item dense>
                                <v-toolbar-title class="headline">SMARTIFY</v-toolbar-title>
                                <v-btn class="ml-5" color="red "  outlined text> Cancelar</v-btn>
                            </v-list-item>
                        </v-col>
                        <v-col md="4" >
                            <v-list-item dense>
                                <v-toolbar-title class="ml-12">NUEVA RUTINA</v-toolbar-title>
                            </v-list-item>
                        </v-col>
                    </v-row>
                </v-container>
            </v-toolbar>
        </div>
%{--<nav class="navbar navbar-expand-lg navbar-light bg-primary navbar-static-top" role="navigation">
    <div class="container-fluid px-5">
        <div class="row px-0 mx-0">
            <div class="col-6 ">
                <div class="navbar-nav align-content-center">
                    <a class="navbar-brand" href="/#">Connectify</a>
                    <a class="nav-item nav-link" href="#"> Mapa <span class="sr-only">(current)</span></a>
                    <a class="nav-item nav-link" href="#">Categorias</a>
                    <a class="nav-item nav-link" href="#">Recientes</a>
                    <a class="nav-item nav-link" href="#">Busqueda <i class="fa fa-search"></i></a>
                </div>
            </div>
            <div class="col-3"></div>
            <div class="col-2 py-3 pr-lg-5 align-content-center">
                <div class="collapse navbar-collapse" aria-expanded="false" style="height: 0.8px;" id="navbarcontent">
                    <ul class="nav navbar-nav ml-auto">
                        <g:if test="${session.authorized && session.authorized.isloggedin}">
                            <img src="${resource(dir: "avatar", file: "/${session.authorized.user.avatar}")}" style="height: 80px; width: 100px" class="card-img-top"/>
                        </g:if>
                        <g:else>
                            <asset:image src="grails.svg" alt="grails logo"/>
                        </g:else>
                    </ul>
                     <ul class="nav navbar-nav ml-auto">
                         <div class="nav-item nav-link" href="#">
                             <g:if test="${session.authorized && session.authorized.isloggedin}">
                                 <g:if test="${session.authorized.user.usertype == globalconfig.user_type.consumer}">
                                     <p style="color: red">welcome ${session.authorized.user.name} ${session.authorized.user.consumer.lastname}</p>
                                 </g:if>
                                 <g:else>
                                     <p style="color: red">welcome ${session.authorized.user.name}</p>
                                 </g:else>
                             </g:if>
                             <g:else>
                                 <p style="color: red">welcome</p>
                             </g:else>
                         </div>
                    </ul>
                </div>
            </div>
        </div>
    </div>

</nav>--}%

<g:layoutBody/>

<div class="footer row" role="contentinfo">
    <div class="col">
        <a href="http://guides.grails.org" target="_blank">
            <asset:image src="advancedgrails.svg" alt="Grails Guides" class="float-left"/>
        </a>
        <strong class="centered"><a href="http://guides.grails.org" target="_blank">Grails Guides</a></strong>
        <p>Building your first Grails app? Looking to add security, or create a Single-Page-App? Check out the <a href="http://guides.grails.org" target="_blank">Grails Guides</a> for step-by-step tutorials.</p>

    </div>
    <div class="col">
        <a href="http://docs.grails.org" target="_blank">
            <asset:image src="documentation.svg" alt="Grails Documentation" class="float-left"/>
        </a>
        <strong class="centered"><a href="http://docs.grails.org" target="_blank">Documentation</a></strong>
        <p>Ready to dig in? You can find in-depth documentation for all the features of Grails in the <a href="http://docs.grails.org" target="_blank">User Guide</a>.</p>

    </div>

    <div class="col">
        <a href="https://grails-slack.cfapps.io" target="_blank">
            <asset:image src="slack.svg" alt="Grails Slack" class="float-left"/>
        </a>
        <strong class="centered"><a href="https://grails-slack.cfapps.io" target="_blank">Join the Community</a></strong>
        <p>Get feedback and share your experience with other Grails developers in the community <a href="https://grails-slack.cfapps.io" target="_blank">Slack channel</a>.</p>
    </div>
</div>


<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

<asset:javascript src="application.js"/>

    </v-app>
</div>
<script src="https://cdn.jsdelivr.net/npm/vue@2.x/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.js"></script>
<script>
    export default {

    }
</script>
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
            ]
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