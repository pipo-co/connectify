package connectify.grailsproject

import grails.gorm.transactions.Transactional
import grails.web.servlet.mvc.GrailsParameterMap

import javax.servlet.http.HttpServletRequest

@Transactional
class ConsumerService {

    AuthenticationService authenticationService
    UserService userService

    def save(GrailsParameterMap params, HttpServletRequest request){
        params.user = userService.setUpUser(params, GlobalConfig.USER_TYPE.CONSUMER)

        Consumer consumer = new Consumer(params)
        def response = AppUtil.saveResponse(false, consumer)
        if(consumer.validate()){
            consumer.save(flush: true)
            if(!consumer.hasErrors()){
                response.isSuccess = true
                userService.uploadAvatar(consumer.user, request)
            }
        }
        return response
    }

    def update(Consumer consumer, GrailsParameterMap params, HttpServletRequest request){
        def changeAvatar = false
        String oldAvatar

        if(params.avatar.filename.equals(""))
            params.avatar = consumer.user.avatar
        else {
            changeAvatar = true
            params.avatar = FileUtil.getAvatarName(params.username, params.avatar.filename)
            oldAvatar = consumer.user.avatar
        }

        consumer.user.properties = params
        consumer.properties = params
        def response = AppUtil.saveResponse(false, consumer)
        if(consumer.validate()){
            consumer.save(flush: true)
            if(!consumer.hasErrors()){
                response.isSuccess = true
                if(changeAvatar) {
                    userService.deleteAvatar(oldAvatar)
                    userService.uploadAvatar(consumer.user, request)
                }
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

        userService.freeUserResources(consumer.user) //Si falla el borrado hay problemas

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
