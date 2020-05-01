package connectify.grailsproject

import grails.gorm.transactions.Transactional

@Transactional
class AuthenticationService {

    private static final AUTHORIZED = "AUTHORIZED"

    def setUserAuthorization(User user){
        def authorization = [isLoggedIn: true, user: user]
        AppUtil.getAppSession()[AUTHORIZED] = authorization
    }

    def doLogin(String username, String password){
        password = password.encodeAsMD5()
        User user = User.findByUsernameAndPassword(username, password)
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

    def getUser(){
        def authorization = AppUtil.getAppSession()[AUTHORIZED]
        return authorization?.user
    }
}
