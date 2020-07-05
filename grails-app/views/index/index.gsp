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
                <h1 class="display-1 mb-4">A new way of enjoying your free time.</h1>
                <h4 class="subheading font-weight-thin mb-4">Become part of our community and enjoy numerous and varied activities near you. Starts at $100/month</h4>
                <v-btn rounded color="#59D0B4" class="py-5" href="/index/register">Register now</v-btn>
            </v-col>
        </v-row>
    </v-parallax>
    <v-container class="my-5">
        <v-row
                align="center"
                justify="center"
        >
            <v-col>
                <h1 class="font-weight-light">How it works?</h1>
            </v-col>
        </v-row>
        <v-row
                align="center"
                justify="center"
        >
            <v-col cols="4">
                <v-card color="#1d1e33" width="350">
                    <v-img src="https://cdn.vuetifyjs.com/images/backgrounds/vbanner.jpg" height="160px"></v-img>
                    <h2 class="font-weight-light white--text">Register</h2>
                    <v-row
                            align="center"
                            justify="center"
                    >
                        <v-col cols="10">
                            <h4 class="font-weight-light white--text">First, you need to became a member. Creating an account in Connectify in a few steps. </h4>
                        </v-col>
                    </v-row>
                </v-card>
            </v-col>

            <v-col cols="4">
                <v-card color="#1d1e33"  width="350">
                    <v-img src="https://cdn.vuetifyjs.com/images/backgrounds/vbanner.jpg" height="160px"></v-img>
                    <h2 class="font-weight-light white--text">Subscribe</h2>
                    <v-row
                            align="center"
                            justify="center"
                    >
                        <v-col cols="10">
                            <h4 class="font-weight-light white--text">You have plenty of options to pay our subscription. Choose the plan that suits you best.</h4>
                        </v-col>
                    </v-row>
                </v-card>
            </v-col>
            <v-col cols="4">
                <v-card color="#1d1e33"  width="350">
                    <v-img src="https://cdn.vuetifyjs.com/images/backgrounds/vbanner.jpg" height="160px"></v-img>
                    <h2 class="font-weight-light white--text">Participate</h2>
                    <v-row
                            align="center"
                            justify="center"
                    >
                        <v-col cols="10">
                            <h4 class="font-weight-light white--text">Once you become a member you can enjoy all the activities provided in our site with no limits or restrictions</h4>
                        </v-col>
                    </v-row>
                </v-card>
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
                        height="450"
                        hide-delimiters
                        show-arrows-on-hover>
                    <v-carousel-item :key="j" v-for="j in ${(int)((activityTList.size() - 1 )/3) + 1}">
                        <v-container fluid>
                            <v-row>
                                <g:each in="${pair.getbValue()}" var="activityt" status="i">
                                    <v-col v-if="(j-1) * 3 <= ${i} && ${i} < (j) * 3">
                                        <v-card color="#1d1e33" class="mx-auto" max-width="400">
                                            <v-container fluid class="pa-0">
                                                <v-img
                                                        src="${assetPath(src: activityt.category.randStockImgPath())}"
                                                        gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                                                        height="150px"
                                                >
                                                    <v-row no-gutters align="center" class="pl-1 py-0">
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
                                                            <v-card-title class="cyan--text ml-3 pa-2"  >By: ${activityt.conectioner.user.name}</v-card-title>
                                                        </v-col>
                                                    </v-row>
                                                    <v-row align="center">
                                                        <v-col class="pa-1" >
                                                            <p class="ml-5" >${activityt.description}</p>
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
</body>
</html>
