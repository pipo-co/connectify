<%--
  Created by IntelliJ IDEA.
  User: tobias
  Date: 1/5/20
  Time: 11:04
--%>


<meta name="layout" content="main"/>
<v-card  class="ma-auto" width="400" height="600" elevation="3">
    <v-container>
        <v-row justify="center" >
            <v-col >
                <asset:image src="logo.png" height="180" alt="Grails Logo"/>
            </v-col>
        </v-row>
        <v-row align="center" justify="center">
                <p class="display-1 indigo--text">Sign in</p>
        </v-row>
            <g:form controller="authentication" action="doLogin" class="form-signin">
                <v-row wrap justify="center" >
                    <v-col cols="12" class="py-0">
                        <v-text-field
                                label="<g:message code="username"/>"
                                name="username"
                                required
                        ></v-text-field>
                    </v-col>
                    <v-col cols="12" class="py-0">
                        <v-text-field
                                v-model="password"
                                label="<g:message code="password"/>"
                                name="password"
                                type="password"
                        ></v-text-field>
                    </v-col>
                    <v-col cols="7">
                        <v-btn type="submit" name="login" color="#2E3047" class="white--text" value="Login" width="200" rounded>Login
                        </v-btn>
                    </v-col>
                    <v-col cols="8" >
                        <v-btn color="#2E3047" class="indigo--text" text>Forgot your password?
                        </v-btn>
                    </v-col>
                </v-row>
            </g:form>
    </v-container>

</v-card>
