package connectify.grailsproject

import grails.gorm.transactions.Transactional

class UserController {

    AuthenticationService authenticationService

    def adminPanel(){
        if(!authenticationService.isAuthenticated() || !authenticationService.getUser().isTypeAdmin()){
            redirect(uri: "/")
            return
        }

        [users: Users.list(params), usersCount: Users.count()]
    }

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

    def getAvatar(Long id){
        Users user = Users.get(id)
        if (!user || !user.avatar || !user.avatarType) {
            response.sendError(404)
            return
        }

        response.setContentType(user.avatarType)
        response.setContentLength(user.avatar.size())

        OutputStream out = response.getOutputStream();
        out.write(user.avatar);
        out.close();
    }
}
