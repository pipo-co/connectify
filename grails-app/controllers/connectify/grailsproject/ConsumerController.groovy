package connectify.grailsproject

class ConsumerController {

    ConsumerService consumerService
    AuthenticationService authenticationService

    def index() {
        def response = consumerService.list(params)
        [userList: response.list, total: response.count]
    }

    def details(Integer id){
        def response = consumerService.getById(id)
        if(!response)
            redirect(controller: "consumer", action: "index")
        else{
            def aux = consumerService.getPropertiesList(response)
            [consumer: response, propertiesList: aux]
        }
    }

    def create(){
        [consumer: flash.redirectParams]
    }

    def save(){
        def response = consumerService.save(params, request)
        if(!response.isSuccess){
            flash.redirectParams = response.model
            redirect(controller: "consumer", action: "create")
        }else{
            redirect(controller: "consumer", action: "index")
        }
    }

    def edit(Integer id){
        if(flash.redirectParams) {
            [consumer: flash.redirectParams]
        } else {
            def response = consumerService.getById(id)
            if(!response){
                redirect(controller: "consumer", action: "index")
            } else {
                [consumer: response]
            }
        }
    }

    def update(){
        def response = consumerService.getById(params.id)
        if(!response) {
            redirect(controller: "consumer", action: "index")
        } else {
            response = consumerService.update(response, params, request)
            if(!response.isSuccess){
                flash.redirectParams = response.model
                redirect(controller: "consumer", action: "edit")
            } else {
                authenticationService.refreshLoggedUser()
                redirect(controller: "consumer", action: "details", id: params.id)
            }
        }
    }

    def delete(Integer id){
        def response = consumerService.getById(id)
        if(!response){
            redirect(controller: "consumer", action: "index")
        } else {
            response = consumerService.delete(response)
            if(response.loggedIn)
                redirect(controller: "authentication", action: "logout")
            else
                redirect(controller: "consumer", action: "index")
        }
    }
}
