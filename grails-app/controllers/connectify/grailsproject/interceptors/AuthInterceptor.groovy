package connectify.grailsproject.interceptors

import connectify.grailsproject.AuthenticationService


class AuthInterceptor {

    AuthenticationService authenticationService

    int order = 0

    AuthInterceptor(){
        // Connectioner
        match(controller: "conectioner", action: "edit")
        match(controller: "conectioner", action: "details") // TODO: Revisar

        // Consumer
        match(controller: "consumer", action: "details")
        match(controller: "consumer", action: "edit")
        match(controller: "consumer", action: "schedule")

        // Activity Template
        match(controller: "activityTemplate", action: "create")
        match(controller: "activityTemplate", action: "index")

        // Activity
        match(controller: "activity", action: "create")
        match(controller: "activity", action: "index")

        // Payment
        match(controller: "payment", action: "index")
        match(controller: "payment", action: "paymentResult")
    }

    boolean before() {
        if(!authenticationService.isAuthenticated()){
            redirect(controller: "authentication", action: "login")
            return false
        }

        return true
    }
}
