package connectify.grailsproject

import grails.gorm.transactions.Transactional
import grails.web.servlet.mvc.GrailsParameterMap

import javax.servlet.http.HttpServletRequest

@Transactional
class UserService {

    def mailService

    def save(GrailsParameterMap params){
        Users user = new Users(params)
        def response = AppUtil.saveResponse(false, user)
        if(user.validate()){
            user.save(flush: true)
            if(!user.hasErrors()){
                response.isSuccess = true
            }
        }
        return response
    }

    def update(Users user, GrailsParameterMap params){
        user.properties = params
        user.confirmCode = null
        def response = AppUtil.saveResponse(false, user)
        if(user.validate()){
            user.save(flush: true)
            if(!user.hasErrors()){
                response.isSuccess = true
            }
        }
        return response
    }

    def getById(Serializable id){
        return Users.get(id)
    }

    def list(GrailsParameterMap params){
        //params.max = params.max ?: GlobalConfig.itemsPerPage() Define limit
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

    def delete(Users user){
        try{
            user.delete(flush: true)
        } catch(Exception e) {
            println(e.getMessage())
            return false
        }
        return true
    }

    def setUpUser(GrailsParameterMap params, HttpServletRequest request, String userType){

        params.userType = userType
        params.confirmCode = UUID.randomUUID().toString()

        Users user = new Users(params)

        assignAvatar(user, request)

        return user
    }

    def assignAvatar(Users user, HttpServletRequest request){
        def img = request.getFile('avatar')

        if(!img.isEmpty()) {
            user.avatarType = img.getContentType()
            user.avatar = img.getBytes()
        }
    }

    def sendConfirmationEmail(Users user){
        mailService.sendMail {
            to user.email
            subject "New User Confirmation"
            html view: "/_mailtemplate", model: [user: user]
            //html g.render(template: "mailtemplate", model: [user: user])
        }
    }
}
