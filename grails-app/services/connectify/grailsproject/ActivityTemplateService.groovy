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

        ActivityTemplate activityT = new ActivityTemplate(params)
        activityT.conectioner = conectioner
        def response = AppUtil.saveResponse(false, activityT)
        if(activityT.validate()){
            conectioner.addToActivityTemplates(activityT)
            conectioner.save(flush: true)
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
}
