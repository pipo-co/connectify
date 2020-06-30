package connectify.grailsproject

import com.mercadopago.MercadoPago
import com.mercadopago.resources.datastructures.preference.Payer
import com.mercadopago.resources.datastructures.preference.PaymentMethods

class PaymentController {

    AuthenticationService authenticationService
    PaymentService paymentService
    ConsumerService consumerService

    def index() {
        MercadoPago.SDK.setAccessToken("TEST-5451080107994143-053019-e43254a62ef71d5fc368a95d4a5b409c-171700364")

        // Se asume Consumer
        Consumer consumer = authenticationService.getUser().consumer

        Payer payer = paymentService.setUpPayer(consumer)

        PaymentMethods paymentMethods = new PaymentMethods().setExcludedPaymentTypes("ticket", "atm")

        // Creo las preferencias para todas las variantes
        def preferencesInfo = new ArrayList()

        preferencesInfo.push([preference: paymentService.setUpPreference(payer, paymentMethods, 1, 100), months: 1, price: 100])
        preferencesInfo.push([preference: paymentService.setUpPreference(payer, paymentMethods, 3, 250), months: 3, price: 250])
        preferencesInfo.push([preference: paymentService.setUpPreference(payer, paymentMethods, 6, 450), months: 6, price: 450])
        preferencesInfo.push([preference: paymentService.setUpPreference(payer, paymentMethods, 12, 700), months: 12, price: 700])

        [preferencesInfo: preferencesInfo]
    }

    def paymentResult(String status, Integer months){
        def response = [success: false]
        if(status.equals("success")){
            Consumer consumer = consumerService.getById(authenticationService.getUser().consumer.id)
            response.success = paymentService.updateSuscribedDate(consumer, months)
            authenticationService.refreshLoggedUser()
            redirect(controller: "consumer", action: "details", params: [id:authenticationService.getUser().consumer.id])
        }
        return response
    }
}
