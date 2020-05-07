package connectify.grailsproject

import grails.gorm.transactions.Transactional

class UserController {

    UserService userService

    def index() {
        def response = userService.list(params)
        [userList: response.list, total: response.count]
    }

    def details(Integer id){
        def response = userService.getById(id)
        if(!response)
            redirect(controller: "user", action: "index")
        else
            [user: response]
        }

    def create(){
        [user: flash.redirectParams]
    }

    def save(){
        def response = userService.save(params)
        if(!response.isSuccess){
            flash.redirectParams = response.model
            redirect(controller: "user", action: "create")
        }else{
            redirect(controller: "user", action: "index")
        }
    }

    def edit(Integer id){
        if(flash.redirectParams) {
            [user: flash.redirectParams]
        } else {
            def response = userService.getById(id)
            if(!response){
                redirect(controller: "user", action: "index")
            } else {
                [user: response]
            }
        }
    }

    def update(){
        def response = userService.getById(params.id)
        if(!response) {
            redirect(controller: "user", action: "index")
        } else {
            response = userService.update(response, params)
            if(!response.isSuccess){
                flash.redirectParams = response.model
                redirect(controller: "user", action: "edit")
            } else {
                redirect(controller: "user", action: "index")
            }
        }
    }


    def delete(Integer id){
        def response = userService.getById(id)
        if(!response){
            redirect(controller: "user", action: "index")
        } else {
            response = userService.delete(response)
            redirect(controller: "user", action: "index")
        }
    }

    @Transactional
    def confirm(String id){ // Email Confirmation Code
        User user = User.findByConfirmCode(id)

        //El confirmCode no era de ningun user
        if(!user) {
            redirect(uri: "/")
            println("nope")
            println(id)
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
