package connectify.grailsproject

class User {
    String username
    String password
    String email
    String name
    String userType;
    Boolean isActive = true;

    static belongsTo = [consumer: Consumer]

    static constraints = {
        username blank: false, unique: true
        password blank: false
        email email: true, blank: false, unique: true
        name blank: false
        consumer nullable: true
    }

    def beforeInsert(){
        this.password = this.password.encodeAsMD5()
    }

    def beforeUpdate(){
        this.password = this.password.encodeAsMD5()
    }
}
