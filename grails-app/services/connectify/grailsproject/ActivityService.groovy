package connectify.grailsproject

import grails.gorm.transactions.Transactional
import grails.web.servlet.mvc.GrailsParameterMap

@Transactional
class ActivityService {

    ActivityTemplateService activityTemplateService

    def list(Serializable activityTemplateId){
        ActivityTemplate activityT = ActivityTemplate.get(activityTemplateId)

        //Tiene que ser actividad del template del conectioner logueado
        if(!activityT || !activityTemplateService.isActivityTemplateFromLoggedConectioner(activityT))
            return [success: false]

        [success: true, activityList: activityT.activity]
    }

    def save(GrailsParameterMap params){
        ActivityTemplate activityTemplate = ActivityTemplate.get(params.activityTId)

        if(!activityTemplate || !activityTemplateService.isActivityTemplateFromLoggedConectioner(activityTemplate))
            return [valid: false]

        params.initTime = params.initTime + ":00"
        Activity activity = new Activity(params)
        activity.activityTemplate = activityTemplate
        def response = [valid: true, isSuccess: false, model: activity]

        if(activity.validate()){
            activityTemplate.addToActivity(activity)
            activityTemplate.save(flush: true)
            if(!activityTemplate.hasErrors()){
                response.isSuccess = true
            }
        }
        return response
    }

    def delete(Activity activity){
        ActivityTemplate activityT = activity.getActivityTemplate()


        activityT.removeFromActivity(activity)
        try{
            activity.delete(flush: true)
            //authenticationService.refreshLoggedUser()
        } catch(Exception e) {
            println(e.getMessage())
        }
        return activityT.id
    }

    def addConsumer(Activity activity, Long consumerId){

        //Validar que la actividad no haya ocurrido ya
        if(!activity.isActive())
            return false

        // Validar que el consumer no este anotado a la actividad todavia
        Optional<Consumer> optConsumer = activity.consumers.stream()
                .filter({consumer -> consumer.id == consumerId}).findFirst()

        if(optConsumer.isPresent())
            return false

        Consumer consumer = Consumer.get(consumerId)

        // Validar que el consumer este suscripto
        if(!consumer || !consumer.isSuscribed())
            return false

        consumer.addToActivities(activity)
        activity.addToConsumers(consumer)
        activity.participants++

        def response = false

        if(activity.validate()){
            activity.save(flush: true)
            if(!activity.hasErrors()){
                response = true
            }
        }
        return response
    }

    def removeConsumer(Activity activity, Long consumerId){

        //Validar que la actividad no haya ocurrido ya
        if(!activity.isActive())
            return false

        // Validar que el consumer este anotado a la actividad todavia
        Optional<Consumer> optConsumer = activity.consumers.stream()
                .filter({consumer -> consumer.id == consumerId}).findFirst()

        if(!optConsumer.isPresent())
            return false

        Consumer consumer = optConsumer.get()

        consumer.removeFromActivities(activity)
        activity.removeFromConsumers(consumer)
        activity.participants--

        def response = false

        if(activity.validate()){
            activity.save(flush: true)
            if(!activity.hasErrors()){
                response = true
            }
        }
        return response
    }

    def getById(Serializable id){
        return Activity.get(id)
    }
}
