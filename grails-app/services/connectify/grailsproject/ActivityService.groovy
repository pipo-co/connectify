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

//        if(!conectioner.isAttached())
//            conectioner.attach()

        activityT.removeFromActivity(activity)
        try{
            activity.delete(flush: true)
            //authenticationService.refreshLoggedUser()
        } catch(Exception e) {
            println(e.getMessage())
        }
        return activityT.id
    }

    def getById(Serializable id){
        return Activity.get(id)
    }
}
