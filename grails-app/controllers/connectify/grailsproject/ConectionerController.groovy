package connectify.grailsproject

class ConectionerController {

    ConectionerService conectionerService
    AuthenticationService authenticationService

    def index() {
        render(view: "/notFound")
    }

    def details(Integer id){
        def response = conectionerService.getById(id)
        if(!response)
            redirect(controller: "conectioner", action: "index")
        else{
            def aux = conectionerService.getPropertiesList(response)
            [conectioner: response, propertiesList: aux]
        }
    }

    def create(){
        [conectioner: flash.redirectParams]
    }

    def save(){
        def response = conectionerService.save(params, request)
        if(!response.isSuccess){
            flash.redirectParams = response.model
            redirect(controller: "conectioner", action: "create")
        }else{
            redirect(uri:"/")
        }
    }

    def edit(Integer id){
        if(flash.redirectParams) {
            [conectioner: flash.redirectParams]
        } else {
            def response = conectionerService.getById(id)
            if(!response){
                redirect(controller: "conectioner", action: "index")
            } else {
                [conectioner: response]
            }
        }
    }

    def update(){
        def response = conectionerService.getById(params.id)
        if(!response) {
            redirect(controller: "conectioner", action: "index")
        } else {
            response = conectionerService.update(response, params, request)
            if(!response.isSuccess){
                flash.redirectParams = response.model
                redirect(controller: "conectioner", action: "edit")
            } else {
                authenticationService.refreshLoggedUser()
                redirect(controller: "conectioner", action: "details", id: params.id)
            }
        }
    }


    def delete(Integer id){
        def response = conectionerService.getById(id)
        if(!response){
            redirect(controller: "conectioner", action: "index")
        } else {
            response = conectionerService.delete(response)
            if(response.loggedIn)
                redirect(controller: "authentication", action: "logout")
            else
                redirect(controller: "conectioner", action: "index")
        }
    }
}
