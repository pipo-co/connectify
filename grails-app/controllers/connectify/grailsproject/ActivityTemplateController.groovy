package connectify.grailsproject

class ActivityTemplateController{

    ActivityTemplateService activityTemplateService

    def index() {
        def response = activityTemplateService.list()
        [activityTList: response.list, total: response.count]
    }

    def details(Integer id){
        def response = activityTemplateService.getById(id)
        if(!response)
            redirect(view: "notFound")
        else
            [activityT: response]
    }

    def create(){
        [activityT: flash.redirectParams]
    }

    def save(){
        def response = activityTemplateService.save(params)
        if(!response){
            redirect(uri: "/")
            return
        }

        if(!response.isSuccess){
            flash.redirectParams = response.model
            redirect(controller: "activityTemplate", action: "create")
        }else{
            redirect(controller: "activityTemplate", action: "index")
        }
    }

    def delete(Integer id){
        def response = activityTemplateService.getById(id)
        if(!response){
            redirect(controller: "activityTemplate", action: "index")
        } else {
            activityTemplateService.delete(response)
            redirect(controller: "activityTemplate", action: "index")
        }
    }
}
