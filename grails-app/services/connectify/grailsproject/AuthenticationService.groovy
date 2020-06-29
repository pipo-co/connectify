package connectify.grailsproject

import grails.gorm.transactions.Transactional

@Transactional
class AuthenticationService {

    private static final AUTHORIZED = "authorized"

    def setUserAuthorization(Users user){
        def authorization = [isLoggedIn: true, user: user]
        AppUtil.getAppSession()[AUTHORIZED] = authorization
    }

    def doLogin(String username, String password){
        password = password.encodeAsSHA256()
        Users user = Users.findByUsernameAndPassword(username, password)
        if(user){
            setUserAuthorization(user)
            return true
        }
        return false
    }

    boolean isAuthenticated(){
        def authorization = AppUtil.getAppSession()[AUTHORIZED]
        if(authorization && authorization.isLoggedIn)
            return true
        return false
    }

    boolean isAuthenticated(Users user){
        return isAuthenticated() && AppUtil.getAppSession()[AUTHORIZED].user.id == user.id
    }

    def getUser(){
        def authorization = AppUtil.getAppSession()[AUTHORIZED]
        return authorization?.user
    }

    def refreshLoggedUser(){
        if(isAuthenticated()){
            def authorization = AppUtil.getAppSession()[AUTHORIZED]
            authorization.user = Users.get(authorization.user.id)
            AppUtil.getAppSession()[AUTHORIZED] = authorization
        }
    }
}
