package connectify.grailsproject

import grails.converters.JSON

class ActivityController {

    ActivityService activityService
    ActivityTemplateService activityTemplateService
    AuthenticationService authenticationService

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
            redirect(controller: "activity", action: "index", id: activityTId)
        }
    }

    //Tiene que estar logueado un Consumer
    def addConsumerToActivity(Long id){
        Activity activity = activityService.getById(id)

        if(!activity){
            println("Error - Activity no encontrado")
            render ([success: false] as JSON)
            return
        }

        if(activity.participants >= activity.activityTemplate.maxParticipants){
            println("Error - Activity esta lleno")
            return false
        }

        Long consumerId = authenticationService.getUser().consumer.id

        def success = activityService.addConsumer(activity, consumerId)

        if(!success){
            println("Fallo la anotacion")
            render ([success: false] as JSON)
            return
        }

        render ([success: true] as JSON)
    }

    def removeConsumerFromActivity(Long id){
        Activity activity = activityService.getById(id)

        if(!activity){
            println("Error - Activity no encontrado")
            render ([success: false] as JSON)
            return
        }

        if(activity.participants <= 0){
            println("Error - Activity vacio")
            return false
        }

        Long consumerId = authenticationService.getUser().consumer.id

        def success = activityService.removeConsumer(activity, consumerId)

        if(!success){
            println("Fallo la anotacion")
            render ([success: false] as JSON)
            return
        }
        render ([success: true] as JSON)
    }
}