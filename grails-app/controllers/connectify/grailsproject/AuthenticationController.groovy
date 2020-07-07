package connectify.grailsproject

class AuthenticationController {

    AuthenticationService authenticationService

    def login() {
        if(authenticationService.isAuthenticated())
            redirect(uri: "/")

        [logInFailed: flash.logInFailed, username: flash.username]
    }

    def doLogin(){
        def ans = authenticationService.doLogin(params.username, params.password)
        if(ans.logged)
            redirect(uri: "/")
        else if(ans.emailNotVerified)
            render(view: "/verifyEmail")
        else{
            flash.username = ans.usernameNotFound ? null : params.username
            flash.logInFailed = true
            redirect(controller: "authentication", action: "login")
        }
    }

    def logout(){
        session.invalidate()
        redirect(uri: "/")
    }
}
