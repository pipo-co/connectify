package connectify.grailsproject

import grails.gorm.transactions.Transactional
import grails.web.servlet.mvc.GrailsParameterMap

import javax.servlet.http.HttpServletRequest

@Transactional
class ConectionerService {

    AuthenticationService authenticationService
    UserService userService

    def save(GrailsParameterMap params, HttpServletRequest request){
        params.user = userService.setUpUser(params, request, GlobalConfig.USER_TYPE.CONNECTIONER)

        Conectioner conectioner = new Conectioner(params)
        def response = AppUtil.saveResponse(false, conectioner)
        if(conectioner.validate()){
            conectioner.save(flush: true)
            if(!conectioner.hasErrors()){
                response.isSuccess = true
                userService.sendConfirmationEmail(conectioner.user)
            }
        }
        return response
    }

    def update(Conectioner conectioner, GrailsParameterMap params, HttpServletRequest request){

        conectioner.user.properties = params
        userService.assignAvatar(conectioner.user, request)
        conectioner.properties = params
        def response = AppUtil.saveResponse(false, conectioner)

        if(conectioner.validate()){
            conectioner.save(flush: true)
            if(!conectioner.hasErrors()){
                response.isSuccess = true
            }
        }
        return response
    }

    def getById(Serializable id){
        return Conectioner.get(id)
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

    def delete(Conectioner conectioner){
        def response = [success: false, loggedIn: false]
        if(authenticationService.isAuthenticated(conectioner.user))
            response.loggedIn = true

        try{
            conectioner.delete(flush: true)
        } catch(Exception e) {
            println(e.getMessage())
            response.success = false
        }
        response.success = true

        return response
    }

    def getPropertiesList(Conectioner conectioner){
        def ans = [username: conectioner.user.username]
        ans.put('email', conectioner.user.email)
        ans.put('name', conectioner.user.name)
        ans.put('CBU', conectioner.cbu)
        ans.put('country', conectioner.country)
        ans.put('province', conectioner.province)
        ans.put('district', conectioner.district)
        String aux = conectioner.street + " " + conectioner.houseNumber
        ans.put('address', aux)
        ans.put('cp', conectioner.cp)
        ans.put(conectioner.phoneType, conectioner.phoneNumber)


        return ans
    }
}
