package connectify.grailsproject

import grails.gorm.transactions.Transactional
import grails.web.servlet.mvc.GrailsParameterMap

import javax.servlet.http.HttpServletRequest

@Transactional
class ActivityTemplateService {

    //Si estoy aca, si o si hay un Conectioner logueado
    AuthenticationService authenticationService

    def save(GrailsParameterMap params){
        Conectioner conectioner = authenticationService.getUser().conectioner
        if(!conectioner.isAttached())
            conectioner.attach()

        Category category = Category.get(params.categoryId)
        if(!category)
            return false


        ActivityTemplate activityT = new ActivityTemplate(params)
        activityT.conectioner = conectioner
        activityT.category = category

        def response = AppUtil.saveResponse(false, activityT)
        if(activityT.validate()){
            activityT.save(flush: true)
            conectioner.addToActivityTemplates(activityT)
            if(!conectioner.hasErrors()){
                response.isSuccess = true
            }
        }
        return response
    }

    def list(){
        //params.max = params.max ?: GlobalConfig.itemsPerPage() //Define limit
        Conectioner conectioner = authenticationService.getUser().conectioner

        if(!conectioner.isAttached())
            conectioner.attach()

        Set<ActivityTemplate> activityTemplateSet = conectioner.activityTemplates
        return [list: activityTemplateSet, count: activityTemplateSet.size()]
    }

    def delete(ActivityTemplate activityT){
        Conectioner conectioner = authenticationService.getUser().conectioner

//        if(!conectioner.isAttached())
//            conectioner.attach()

        conectioner.removeFromActivityTemplates(activityT)
        try{
            activityT.delete(flush: true)
            authenticationService.refreshLoggedUser()
        } catch(Exception e) {
            println(e.getMessage())
        }
    }

    def getById(Serializable id){
        return ActivityTemplate.get(id)
    }

    def isActivityTemplateFromLoggedConectioner(ActivityTemplate activityTemplate){
        Conectioner conectioner = authenticationService.getUser().conectioner
        Long conectionerId = activityTemplate.conectioner.id
        return conectionerId.equals(conectioner.id)
    }

    def isActivityTemplateFromLoggedConectioner(Serializable activityTemplateId){
        ActivityTemplate activityTemplate = ActivityTemplate.get(activityTemplateId)
        return activityTemplate && isActivityTemplateFromLoggedConectioner(activityTemplate)
    }
}
