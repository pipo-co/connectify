package connectify.grailsproject


class ConectionerInterceptor {

    AuthenticationService authenticationService

    ConectionerInterceptor(){
        match(controller: "activityTemplate")
    }

    boolean before() {
        if(!authenticationService.isAuthenticated() || !authenticationService.getUser().userType.equals(GlobalConfig.USER_TYPE.CONNECTIONER)){
            redirect(uri: "/")
            return false
        }
        return true
    }

}
