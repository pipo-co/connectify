package connectify.grailsproject

import grails.gorm.transactions.Transactional
import grails.web.servlet.mvc.GrailsParameterMap

@Transactional
class ConsumerService {

    AuthenticationService authenticationService

    def save(GrailsParameterMap params){
        params.userType = GlobalConfig.USER_TYPE.CONSUMER
        params.user = new User(params)
        Consumer consumer = new Consumer(params)
        def response = AppUtil.saveResponse(false, consumer)
        if(consumer.validate()){
            consumer.save(flush: true)
            if(!consumer.hasErrors()){
                response.isSuccess = true
            }
        }
        return response
    }

    def update(Consumer consumer, GrailsParameterMap params){
        consumer.user.properties = params
        consumer.properties = params
        def response = AppUtil.saveResponse(false, consumer)
        if(consumer.validate()){
            consumer.save(flush: true)
            if(!consumer.hasErrors()){
                response.isSuccess = true
            }
        }
        return response
    }

    def getById(Serializable id){
        return Consumer.get(id)
    }

    def list(GrailsParameterMap params){
        //params.max = params.max ?: GlobalConfig.itemsPerPage() //Define limit
        List<User> userList = User.createCriteria().list(params){
            if(params?.colName && params?.colValue){
                like(params.colName, "%" + params.colValue + "%")
            }
            if(!params.sort){
                order("id", "desc")
            }
        }
        return [list: userList, count: userList.size()]
    }

    def delete(Consumer consumer){
        def response = [success: false, loggedIn: false]
        if(authenticationService.isAuthenticated(consumer.user))
            response.loggedIn = true

        try{
            consumer.delete(flush: true)
        } catch(Exception e) {
            println(e.getMessage())
            response.success = false
        }
        response.success = true
        return response
    }
}
