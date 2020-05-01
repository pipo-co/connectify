package connectify.grailsproject

class AuthenticationController {

    AuthenticationService authenticationService

    def login() {
        if(authenticationService.isAuthenticated())
            redirect(controller: "user", action: "index")
    }

    def doLogin(){
        if(authenticationService.doLogin(params.username, params.password))
            redirect(controller: "user", action: "index")
        else
            redirect(controller: "authentication", action: "login")
    }

    def logout(){
        session.invalidate()
        redirect(uri: "/")
    }
}
