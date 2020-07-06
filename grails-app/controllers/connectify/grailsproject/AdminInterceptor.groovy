package connectify.grailsproject


class AdminInterceptor {

    AuthenticationService authenticationService

    AdminInterceptor(){
        matchAll().excludes(controller: "user")
                .excludes(controller: "authentication", action: "logout")
                .excludes(controller: "conectioner", action: "delete")
                .excludes(controller: "consumer", action: "delete")
    }

    boolean before() {
        if(authenticationService.isAuthenticated() && authenticationService.getUser().isTypeAdmin()){
            redirect(controller: "user", action: "adminPanel")
            return false
        }
        return true
    }
}
