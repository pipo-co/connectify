package connectify.grailsproject.interceptors

import connectify.grailsproject.AuthenticationService


class ConsumerInterceptor {

    AuthenticationService authenticationService

    int order = 1

    ConsumerInterceptor(){
        // Consumer
        match(controller: "consumer", action: "details")
        match(controller: "consumer", action: "edit")
        match(controller: "consumer", action: "schedule")

        // Payment
        match(controller: "payment", action: "index")
        match(controller: "payment", action: "paymentResult")
    }

    boolean before() {
        if(!authenticationService.getUser().isTypeConsumer()){
            redirect(controller: "authentication", action: "login")
            return false
        }
        return true
    }
}
