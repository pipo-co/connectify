package connectify.grailsproject

import grails.gorm.transactions.Transactional
import grails.web.servlet.mvc.GrailsParameterMap

import javax.servlet.http.HttpServletRequest

@Transactional
class ConsumerService {

    AuthenticationService authenticationService
    UserService userService

    def save(GrailsParameterMap params, HttpServletRequest request){
        params.user = userService.setUpUser(params, request, GlobalConfig.USER_TYPE.CONSUMER)

        Consumer consumer = new Consumer(params)
        def response = AppUtil.saveResponse(false, consumer)
        if(consumer.validate()){
            consumer.save(flush: true)
            if(!consumer.hasErrors()){
                response.isSuccess = true
                userService.sendConfirmationEmail(consumer.user)
            }
        }
        return response
    }

    def update(Consumer consumer, GrailsParameterMap params, HttpServletRequest request){

        consumer.user.properties = params
        userService.assignAvatar(consumer.user, request)
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

        List<Users> userList = Users.createCriteria().list(params){
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

    def getPropertiesList(Consumer consumer){
        def ans = [username: consumer.user.username]
        ans.put('email', consumer.user.email)
        ans.put('name', consumer.user.name)
        ans.put('last.name', consumer.lastName)
        ans.put(consumer.docType, consumer.document)
        ans.put('country', consumer.country)
        ans.put('province', consumer.province)
        ans.put('district', consumer.district)
        String aux = consumer.street + " " + consumer.houseNumber
        ans.put('address', aux)
        ans.put('cp', consumer.cp)
        ans.put(consumer.phoneType, consumer.phoneNumber)

        return ans
    }
}
