package connectify.grailsproject


class SecurityInterceptor {

    AuthenticationService authenticationService

//    SecurityInterceptor(){
//        matchAll().excludes(controller: "authentication")
//    }
//
//    boolean before() {
//        if(!authenticationService.isAuthenticated()){
//            redirect(controller: "authentication", action: "login")
//            return false
//        }
//        return true
//    }

    SecurityInterceptor(){
        match(controller: "user", action: "create")
    }

    boolean before() {
        if(authenticationService.isAuthenticated()){
            redirect(uri: "/")
            return false
        }
        return true
    }

//    boolean after() { true }
//
//    void afterView() {
//        // no-op
//    }
}
