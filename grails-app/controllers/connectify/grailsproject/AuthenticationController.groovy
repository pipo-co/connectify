package connectify.grailsproject

class AuthenticationController {

    AuthenticationService authenticationService

    def login() {
        if(authenticationService.isAuthenticated())
            redirect(uri: "/")
    }

    def doLogin(){
        def ans = authenticationService.doLogin(params.username, params.password)
        if(ans.logged)
            redirect(uri: "/")
        else if(ans.emailNotVerified)
            render(view: "/verifyEmail")
        else
            redirect(controller: "authentication", action: "login")
    }

    def logout(){
        session.invalidate()
        redirect(uri: "/")
    }
}
