package connectify.grailsproject

import grails.gorm.transactions.Transactional
import grails.web.servlet.mvc.GrailsParameterMap

import javax.servlet.http.HttpServletRequest

@Transactional
class ConectionerService {

    AuthenticationService authenticationService
    UserService userService

    def save(GrailsParameterMap params, HttpServletRequest request){
        params.user = userService.setUpUser(params, GlobalConfig.USER_TYPE.CONNECTIONER)

        Conectioner conectioner = new Conectioner(params)
        def response = AppUtil.saveResponse(false, conectioner)
        if(conectioner.validate()){
            conectioner.save(flush: true)
            if(!conectioner.hasErrors()){
                response.isSuccess = true
                userService.sendConfirmationEmail(conectioner.user)
                userService.uploadAvatar(conectioner.user, request)
            }
        }
        return response
    }

    def update(Conectioner conectioner, GrailsParameterMap params, HttpServletRequest request){
        def changeAvatar = false
        String oldAvatar

        if(params.avatar.filename.equals(""))
            params.avatar = conectioner.user.avatar
        else {
            changeAvatar = true
            params.avatar = FileUtil.getAvatarName(params.username, params.avatar.filename)
            oldAvatar = conectioner.user.avatar
        }

        conectioner.user.properties = params
        conectioner.properties = params
        def response = AppUtil.saveResponse(false, conectioner)
        if(conectioner.validate()){
            conectioner.save(flush: true)
            if(!conectioner.hasErrors()){
                response.isSuccess = true
                if(changeAvatar) {
                    userService.deleteAvatar(oldAvatar)
                    userService.uploadAvatar(conectioner.user, request)
                }
            }
        }
        return response
    }

    def getById(Serializable id){
        return Conectioner.get(id)
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

    def delete(Conectioner conectioner){
        def response = [success: false, loggedIn: false]
        if(authenticationService.isAuthenticated(conectioner.user))
            response.loggedIn = true

        userService.freeUserResources(conectioner.user) //Si falla el borrado hay problemas

        try{
            conectioner.delete(flush: true)
        } catch(Exception e) {
            println(e.getMessage())
            response.success = false
        }
        response.success = true

        return response
    }
}
