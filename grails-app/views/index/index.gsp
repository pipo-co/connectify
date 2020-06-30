<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to Connectify</title>
</head>
<body>
<g:if test="${!(session.authorized && session.authorized.isLoggedIn)}">
    <v-parallax dark src="https://cdn.vuetifyjs.com/images/backgrounds/vbanner.jpg"
    >
        <v-row
                align="center"
                justify="center"
        >
            <v-col class="text-center" cols="12">
                <h1 class="display-1 mb-4">Una nueva forma de realizar cursos.</h1>
                <h4 class="subheading font-weight-thin mb-4">Registrate ya para conocer todos los beneficios de ser un miembo de Connectify.</h4>
                <v-btn rounded color="#59D0B4" class="py-5" href="/consumer/create">REGISTRATE</v-btn>
            </v-col>
        </v-row>
    </v-parallax>
    <v-container class="my-5">
        <v-row
                align="center"
                justify="center"
        >
            <v-col cols="12">
                <h1>Cómo funciona</h1>
            </v-col>
        </v-row>
        <v-row
                align="center"
                justify="center"
        >
            <v-col cols="4">
                <v-img src="https://cdn.vuetifyjs.com/images/backgrounds/vbanner.jpg"></v-img>
                <h2>Registrate</h2>
                <v-row
                        align="center"
                        justify="center"
                >
                    <v-col cols="8">
                        <h4 class="font-weight-light">si te registras sos muy capo tengo que alimentar a una familia xfa</h4>
                    </v-col>
                </v-row>
            </v-col>

            <v-col cols="4">
                <v-img src="https://cdn.vuetifyjs.com/images/backgrounds/vbanner.jpg"></v-img>
                <h2>Registrate</h2>
                <v-row
                        align="center"
                        justify="center"
                >
                    <v-col cols="8">
                        <h4 class="font-weight-light">si te registras sos muy capo tengo que alimentar a una familia xfa</h4>
                    </v-col>
                </v-row>
            </v-col>

            <v-col cols="4">
                <v-img src="https://cdn.vuetifyjs.com/images/backgrounds/vbanner.jpg"></v-img>
                <h2>Registrate</h2>
                <v-row
                        align="center"
                        justify="center"
                >
                    <v-col cols="8">
                        <h4 class="font-weight-light">si te registras sos muy capo tengo que alimentar a una familia xfa</h4>
                    </v-col>
                </v-row>
            </v-col>
        </v-row>
    </v-container>
    <v-container class="my-5">
        <v-row
                align="center"
                justify="center"
        >
            <v-col cols="6">
                <h1>¿Tenes cursos para ofrecer? Este tambien es tu lugar</h1>
                <h4 class="font-weight-light">Si te interesa formar parte de Connectify y brindar cursos a la comunidad:</h4>
            </v-col>
        </v-row>
        <v-row>
            <v-col>
                <v-btn rounded color="#59D0B4" href="conectioner/create">Registrate como Connectioner</v-btn>
            </v-col>
        </v-row>
    </v-container>

</g:if>
<g:else>
    <v-container fluid >
        <v-row>
            <v-col>
                <v-carousel
                        cycle
                        height="350"
                        hide-delimiter-background
                        show-arrows-on-hover
                >
                    <v-carousel-item>
                        <v-sheet height="100%">
                            <v-row class="fill-height" align="center" justify="center">
                                <div class="display-3">Slide 1</div>
                            </v-row>
                        </v-sheet>
                    </v-carousel-item><v-carousel-item>
                    <v-sheet height="100%">
                        <v-row class="fill-height" align="center" justify="center">
                            <div class="display-3">Slide 2</div>
                        </v-row>
                    </v-sheet>
                </v-carousel-item>
                </v-carousel>
            </v-card>
            </v-col>
        </v-row>
    </v-container>
    <g:each in="${activityTList}" var="pair" >
        <v-container fluid>
            <v-row no-gutters>
                <v-col>
                    <p class="ml-5 headline">Category: ${pair.getaValue().name}</p>
                </v-col>
            </v-row>
            <v-row>
                <v-carousel
                        height="570"
                        hide-delimiters
                        show-arrows-on-hover>
                    <v-carousel-item :key="j" v-for="j in 4">
                        <v-container fluid>
                            <v-row>
                                <g:each in="${pair.getbValue()}" var="activityt" status="i">
                                    <v-col v-if="(j-1) * 3 <= ${i} && ${i} < (j) *3">
                                        <v-card  class="mx-auto"
                                                 max-width="400">
                                            <v-container fluid class="pa-0">
                                                <v-img
                                                        src="https://cdn.vuetifyjs.com/images/cards/house.jpg"
                                                        gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                                                        height="160px"
                                                >
                                                    <v-row no-gutters align="center" class="pl-1 py-0">
                                                        <v-col cols="10" class="pa-0">
                                                            <v-card-subtitle class="pa-0 white--text">Categoria: ${activityt.category.name}</v-card-subtitle>
                                                            <v-card-title class="pa-0  white--text"> ${activityt.name}</v-card-title>
                                                        </v-col>
                                                        <v-col cols="2" class="pa-0">
                                                            <v-btn icon color="#59D0B4" class="pa-0" >
                                                                <v-icon>
                                                                    mdi-heart
                                                                </v-icon>
                                                            </v-btn>
                                                        </v-col>
                                                    </v-row>
                                                </v-img>
                                            </v-container>
                                            <v-card-actions class="pa-0">
                                                <v-container fluid class="pa-1">
                                                    <v-row align="center">
                                                        <v-col cols="9" class="pa-1">
                                                            <v-card-title class="cyan--text ml-3 pa-2"  >By: ${activityt.conectioner.user.name}</v-card-title>
                                                        </v-col>
                                                    </v-row>
                                                    <v-row align="center">
                                                        <v-col class="pa-1" >
                                                            <p class="ml-5" >Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus dolore eius facilis inventore laboriosam mollitia officiis porro, qui, quia quod, repellendus tempore temporibus vel! Beatae doloremque id obcaecati porro quas.${activityt.description}</p>
                                                        </v-col>
                                                    </v-row>
                                                    <v-row class="ma-0 pa-0">
                                                        <v-col cols="8"></v-col>
                                                        <v-col class=" ma-0">
                                                            <v-btn rounded color="#59D0B4" href="activityTemplate/details/${activityt.id}">
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
    </g:each>
</g:else>



<div id="content" role="main">
    <div id="controllers" role="navigation">
        <h2>Available Controllers:</h2>
        <ul>
            <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                <li class="controller">
                    <g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link>
                </li>
            </g:each>
        </ul>
    </div>
</div>

</body>
</html>
