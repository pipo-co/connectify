package connectify.grailsproject


class AuthInterceptor {

    AuthenticationService authenticationService

    AuthInterceptor(){
        matchAll().excludes(controller: 'authentication')
    }

    boolean before() {
        authenticationService.refreshLoggedUser()
        return true
    }

//    boolean after() { true }
//
//    void afterView() {
//        // no-op
//    }
}
