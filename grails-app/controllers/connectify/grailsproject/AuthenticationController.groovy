package connectify.grailsproject

class AuthenticationController {

    AuthenticationService authenticationService

    def login() {
        if(authenticationService.isAuthenticated())
            redirect(uri: "/")
    }

    def doLogin(){
        if(authenticationService.doLogin(params.username, params.password))
            redirect(uri: "/")
        else
            redirect(controller: "authentication", action: "login")
    }

    def logout(){
        session.invalidate()
        redirect(uri: "/")
    }
}
