package connectify.grailsproject

class User {
    String username
    String password
    String email
    String name
    String avatar
    String userType;
    Boolean isActive = true;

    static belongsTo = [consumer: Consumer]

    static constraints = {
        username blank: false, unique: true
        password blank: false
        email email: true, blank: false, unique: true
        name blank: false
        consumer nullable: true
        avatar nullable: true, blank: true
    }

    def beforeInsert(){
        this.password = this.password.encodeAsSHA256()
    }
}
