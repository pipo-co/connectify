package connectify.grailsproject

import com.mercadopago.resources.Preference
import com.mercadopago.resources.datastructures.preference.Address
import com.mercadopago.resources.datastructures.preference.BackUrls
import com.mercadopago.resources.datastructures.preference.Identification
import com.mercadopago.resources.datastructures.preference.Item
import com.mercadopago.resources.datastructures.preference.Payer
import com.mercadopago.resources.datastructures.preference.PaymentMethods
import com.mercadopago.resources.datastructures.preference.Phone
import grails.gorm.transactions.Transactional
import grails.web.mapping.LinkGenerator

import java.time.LocalDate

@Transactional
class PaymentService {

    LinkGenerator grailsLinkGenerator

    Payer setUpPayer(Consumer consumer){
        return new Payer()
                .setEmail(consumer.user.email)
                .setName(consumer.user.name)
                .setSurname(consumer.lastName)
                .setAddress(new Address()
                        .setStreetName(consumer.street)
                        .setStreetNumber(consumer.houseNumber.toInteger())
                        .setZipCode(consumer.cp))
                .setPhone(new Phone()
                        .setAreaCode("")
                        .setNumber(consumer.phoneNumber))
                .setIdentification(new Identification()
                        .setType(consumer.docType)
                        .setNumber(consumer.document))
    }

    Preference setUpPreference(Payer payer, PaymentMethods paymentMethods, Integer months, Float price){
        BackUrls backUrls = new BackUrls(
                grailsLinkGenerator.link(action: "paymentResult", params: [status: "success", months: months], absolute: true),
                grailsLinkGenerator.link(action: "paymentResult", params: [status: "pending", months: months], absolute: true),
                grailsLinkGenerator.link(action: "paymentResult", params: [status: "failure", months: months], absolute: true)
        )

        Item item = new Item()
                .setTitle("Suscripcion por " + months.toString() + ((months > 1)? " meses" : " mes"))
                .setQuantity(1)
                .setCurrencyId("ARS")
                .setUnitPrice(price)

        return new Preference()
                .setPayer(payer)
                .setBackUrls(backUrls)
                .setPaymentMethods(paymentMethods)
                //.setAutoReturn(Preference.AutoReturn.all)
                .setBinaryMode(true)
                .appendItem(item)
                .save()
    }

    Boolean updateSuscribedDate(Consumer consumer, Integer months){
        consumer.suscribedUntil = LocalDate.now().plusMonths(months)
        if(consumer.validate()) {
                consumer.save(flush: true)
            if (!consumer.hasErrors()) {
                return true
            }
        }
        return false
    }
}
