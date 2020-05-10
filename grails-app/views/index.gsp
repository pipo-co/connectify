<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to Connectify</title>
</head>
<body>
%{--<content tag="nav">
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Application Status <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li class="dropdown-item"><a href="#">Environment: ${grails.util.Environment.current.name}</a></li>
            <li class="dropdown-item"><a href="#">App profile: ${grailsApplication.config.grails?.profile}</a></li>
            <li class="dropdown-item"><a href="#">App version:
                <g:meta name="info.app.version"/></a>
            </li>
            <li role="separator" class="dropdown-divider"></li>
            <li class="dropdown-item"><a href="#">Grails version:
                <g:meta name="info.app.grailsVersion"/></a>
            </li>
            <li class="dropdown-item"><a href="#">Groovy version: ${GroovySystem.getVersion()}</a></li>
            <li class="dropdown-item"><a href="#">JVM version: ${System.getProperty('java.version')}</a></li>
            <li role="separator" class="dropdown-divider"></li>
            <li class="dropdown-item"><a href="#">Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</a></li>
        </ul>
    </li>
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Artefacts <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li class="dropdown-item"><a href="#">Controllers: ${grailsApplication.controllerClasses.size()}</a></li>
            <li class="dropdown-item"><a href="#">Domains: ${grailsApplication.domainClasses.size()}</a></li>
            <li class="dropdown-item"><a href="#">Services: ${grailsApplication.serviceClasses.size()}</a></li>
            <li class="dropdown-item"><a href="#">Tag Libraries: ${grailsApplication.tagLibClasses.size()}</a></li>
        </ul>
    </li>
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Installed Plugins <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
                <li class="dropdown-item"><a href="#">${plugin.name} - ${plugin.version}</a></li>
            </g:each>
        </ul>
    </li>
</content>--}%
<v-container fluid>
    <v-row>
        <v-col>
            <v-card raised>
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
    <v-row>
        <v-col>
            <p class="ml-5 headline">Category:</p>
        </v-col>
    </v-row>
</v-container>


    <v-container>
        <v-row dense>
        <v-col
                v-for="card in cards"
                :key="card.title"
                :cols="card.flex"
        >
            <v-card  class="mx-auto"
                     max-width="400"
                     max-height="300">
                <v-img
                        :src="card.src"

                        gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                        height="200px"
                >
                    <v-container fluid class="pa-0">
                        <v-row no-gutters align="center" class="pl-1 py-0">
                            <v-col cols="10" class="pa-0">
                                <v-card-subtitle class="pa-1 white--text">Categoria: {{card.category}}</v-card-subtitle>
                            </v-col>
                            <v-col cols="1" class="pa-0">
                                <v-btn text class="pa-0" >
                                    <v-icon color="#59D0B4" right>
                                        mdi-heart
                                    </v-icon>
                                </v-btn>
                            </v-col>
                        </v-row>
                        <v-row no-gutters align="top">
                            <v-col cols="10" class="pa-0">
                                <v-card-title class="pa-0 ml-2 white--text" v-text="card.title"></v-card-title>
                            </v-col>
                        </v-row>
                        <v-row>
                            <v-col><v-spacer></v-spacer></v-col>
                        </v-row>
                        <v-row>
                            <v-col><v-spacer></v-spacer></v-col>
                        </v-row>
                        <v-row>
                            <v-col><v-spacer></v-spacer></v-col>
                        </v-row>
                        <v-row no-gutters align="end" >
                            <v-col cols="9" class="pa-0">
                                <v-card-title class="pa-0 ml-2 white--text" >Connectioner: {{card.connectioner}}</v-card-title>
                            </v-col>
                            <v-col cols="2" class="pa-2">
                                <v-btn rounded class="pa-2 white--text" color="#59D0B4" bottom >
                                    Subscribe
                                </v-btn>
                            </v-col>
                        </v-row>
                    </v-container>
                </v-img>

                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn icon>
                        <v-icon>mdi-heart</v-icon>
                    </v-btn>

                    <v-btn icon>
                        <v-icon>mdi-bookmark</v-icon>
                    </v-btn>

                    <v-btn icon>
                        <v-icon>mdi-share-variant</v-icon>
                    </v-btn>
                </v-card-actions>
            </v-card>
        </v-col>
    </v-row>
</v-container>



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
