package connectify.grailsproject

import grails.gorm.transactions.Transactional

class UserController {

    @Transactional
    def confirm(String id){ // Email Confirmation Code
        Users user = Users.findByConfirmCode(id)

        //El confirmCode no era de ningun user
        if(!user) {
            redirect(view: "notFound")
            println("email confirmation failed")
            println("user:" + id)
            return
        }

        def response = AppUtil.saveResponse(false, user)
        user.isActive = true
        user.confirmCode = null
        if(user.validate()){
            user.save(flush: true)
            if(!user.hasErrors()){
                response.isSuccess = true
            }
        }
        redirect(uri: "/")
    }
}
