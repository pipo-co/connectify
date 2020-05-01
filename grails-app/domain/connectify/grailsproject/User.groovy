package connectify.grailsproject

class User {
    String username
    String password
    String email
    String name
    Boolean isActive = true;

    static constraints = {
        username blank: false, unique: true
        password blank: false
        email email: true, blank: false
        name blank:false
    }

    def beforeInsert(){
        this.password = this.password.encodeAsMD5()
    }

    def beforeUpdate(){
        this.password = this.password.encodeAsMD5()
    }
}
