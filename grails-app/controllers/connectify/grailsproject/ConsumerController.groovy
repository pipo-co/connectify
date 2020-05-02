package connectify.grailsproject

class ConsumerController {

    ConsumerService consumerService

    def index() {
        def response = consumerService.list(params)
        [consumerList: response.list, total: response.count]
    }

    def details(Integer id){
        def response = consumerService.getById(id)
        if(!response)
            redirect(controller: "consumer", action: "index")
        else
            [consumer: response]
    }

    def create(){
        [consumer: flash.redirectParams]
    }

    def save(){
        def response = consumerService.save(params)
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
            response = consumerService.update(response, params)
            if(!response.isSuccess){
                flash.redirectParams = response.model
                redirect(controller: "consumer", action: "edit")
            } else {
                redirect(controller: "consumer", action: "index")
            }
        }
    }


    def delete(Integer id){
        def response = consumerService.getById(id)
        if(!response){
            redirect(controller: "consumer", action: "index")
        } else {
            response = consumerService.delete(response)
            redirect(controller: "consumer", action: "index")
        }
    }
}