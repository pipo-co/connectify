package connectify.grailsproject

class ActivityController {

    ActivityService activityService
    ActivityTemplateService activityTemplateService

    // Solo pueden entrar los conectioners
    def index(Integer id) {

        def response = activityService.list(id)
        if(!response.success)
            redirect(uri: "/")
        else
            [activityList: response.activityList, activityTId: id]
    }

    def create(Integer id){
        if(!activityTemplateService.isActivityTemplateFromLoggedConectioner(id))
            redirect(uri: "/")
        else
            [activity: flash.redirectParams, activityTId: id]
    }

    def save(){
        def response = activityService.save(params)
        if(!response.valid)
            redirect(uri: "/")
        else if(!response.isSuccess){
            flash.redirectParams = response.model
            redirect(controller: "activity", action: "create", id: params.activityTId)
        }else{
            redirect(controller: "activity", action: "index", id: params.activityTId)
        }
    }

    def delete(Integer id){
        def response = activityService.getById(id)
        if(!response){
            redirect(uri: "/")
        } else {
            def activityTId = activityService.delete(response)
            redirect(controller: "activityTemplate", action: "index", id: activityTId)
        }
    }
}
