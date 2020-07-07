package connectify.grailsproject.interceptors

import connectify.grailsproject.AuthenticationService


class NoAuthInterceptor {

    AuthenticationService authenticationService

    int order = 0

    NoAuthInterceptor(){
        // Connectioner
        match(controller: "conectioner", action: "create")

        // Consumer
        match(controller: "consumer", action: "create")

        // Authentication
        match(controller: "authentication", action: "login")

        // Index Register
        match(controller: "index", action: "register")
    }

    boolean before() {
        if(authenticationService.isAuthenticated()){
            redirect(uri: "/")
            return false
        }
        return true
    }
}
