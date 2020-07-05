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
        def ans = [logged: false, emailNotVerified: false]

        password = password.encodeAsSHA256()
        Users user = Users.findByUsernameAndPassword(username, password)

        if(user){
            ans.emailNotVerified = !user.isActive
            if(user.isActive) {
                ans.logged = true
                setUserAuthorization(user)
                return ans
            }
        }
        return ans
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

    Users getUser(){
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
